#!/usr/bin/env python3
"""Generate the review-only assembly dumps in asm/ with a pinned zig cc."""
import argparse
import re
import subprocess
import sys
import tempfile
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
SOURCE = "src/vm.c"
ZIG_VERSION = "0.15.1"
TARGETS = ["aarch64-macos", "x86_64-linux-gnu"]
# Mirrors the flags build.rs compiles the shipped vm with
FLAGS = ["-O3", "-std=c2x", "-Wall", "-Wextra", "-DNDEBUG", "-DJUMP_MODE=0", "-DDECODE_MODE=1"]
# zig cc emits debug info by default and warns about its own unused '-c'
ZIG_FLAGS = ["-g0", "-Wno-unused-command-line-argument"]

# Unwind and liveness noise
DROP = re.compile(r"\s*(\.cfi_|[;#] kill:)")
# Function-numbered labels become function relative; the sdk version comes from the host
RENAME = [
    (re.compile(r"\.?LBB\d+_"), ".L"),
    (re.compile(r"\.?LJTI\d+_"), ".LJTI"),
    (re.compile(r"\.?Lfunc_end\d+"), ".Lfunc_end"),
    (re.compile(r"^(\s*\.build_version.*?)\ssdk_version.*"), r"\1"),
]


def zig(*args):
    try:
        return subprocess.run(["zig", *args], cwd=ROOT, check=True, stdout=subprocess.PIPE, text=True).stdout
    except FileNotFoundError:
        sys.exit(f"asm: zig not found, install zig {ZIG_VERSION}")
    except subprocess.CalledProcessError:
        sys.exit(f"asm: zig {args[0]} failed")


def normalize(text):
    lines = [line for line in text.split("\n") if not DROP.match(line)]
    for pattern, replacement in RENAME:
        lines = [pattern.sub(replacement, line) for line in lines]
    return "\n".join(lines)


def dump(target, clang):
    args = [*FLAGS, *ZIG_FLAGS, "-target", target, "-S", SOURCE]
    with tempfile.TemporaryDirectory() as tmp:
        out = Path(tmp) / "vm.s"
        zig("cc", *args, "-o", str(out))
        text = out.read_text()
    comment = ";" if "macos" in target else "#"
    return f"{comment} zig {ZIG_VERSION}, {clang}: zig cc {' '.join(args)}\n" + normalize(text)


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--check", action="store_true", help="compare with the tracked dumps instead of writing them")
    check = parser.parse_args().check
    version = zig("version").strip()
    if version != ZIG_VERSION:
        sys.exit(f"asm: zig {version} found, want {ZIG_VERSION}")
    clang = zig("cc", "--version").splitlines()[0]
    stale = []
    for target in TARGETS:
        path = ROOT / "asm" / f"vm.{target}.s"
        text = dump(target, clang)
        if not check:
            path.parent.mkdir(exist_ok=True)
            path.write_text(text)
            print(path.relative_to(ROOT))
        elif not path.exists() or path.read_text() != text:
            stale.append(path.relative_to(ROOT))
    for path in stale:
        print(f"asm: {path} is stale, run make asm", file=sys.stderr)
    return 1 if stale else 0


if __name__ == "__main__":
    sys.exit(main())
