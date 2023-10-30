#!/usr/bin/env bash
set -euo pipefail

function test_conf () {
  make clean && make CFLAGS="-DJUMP_MODE=$1 -DDECODE_MODE=$2"
  local dst="output/$3/$4/conf_J$1_D$2"
  mkdir -p "$dst"
  clang -std=c2x -O3 -S src/vm.c -o "$dst/vm.s" 
  for f in test/*; do
    local r=$(basename "$f" '.qbc')
    hyperfine -N --warmup 3 "bin/quickaml $f" --export-markdown "$dst/$r.md" --export-json "$dst/$r.json"
  done
}

tri="$(clang -print-target-triple)"
dt=$(date -u +"%Y-%m-%dT%H_%M_%SZ") 
for i in {0..1}; do
  for j in {0..1}; do
    test_conf $i $j $dt $tri
  done
done
