# Compiler
CC := clang

# VM configuration macros, one file per architecture, shared with build.rs
# and scripts/asm.py
ARCH := $(shell uname -m | sed s/arm64/aarch64/)
CFLAGS := $(shell cat flags/$(ARCH))

# Compiler flags
_CFLAGS := -Wall -Wextra -O3 -std=c2x -DNDEBUG

_CFLAGS_RELDBG := -Wall -Wextra -O3 -ggdb3 -std=c2x -DNDEBUG

# Compiler flags for debugging
_CFLAGS_DBG := -Wall -Wextra -O0 -fpie -ggdb3 -std=c2x -DDEBUG -fsanitize=address

# Directories
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INC_DIR := src

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.c)

# Object files
OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

OBJS_RELDBG := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.reldbg.o,$(SRCS))

OBJS_DBG := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.dbg.o,$(SRCS))

# Header files
INCS := $(wildcard $(INC_DIR)/*.h)

# Library name
TARGET := $(BIN_DIR)/libquickaml.a

TARGET_RELDBG := $(BIN_DIR)/libquickaml.reldbg.a

TARGET_DBG := $(BIN_DIR)/libquickaml.dbg.a

# Phony targets (non-file targets)
.PHONY: all rel reldbg debug asm asm-check distclean clean

# Default target
all: $(TARGET) $(TARGET_RELDBG) $(TARGET_DBG)

rel: $(TARGET)

# Rule to create the library
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	ar rcs $@ $^

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS) $(CFLAGS) -c $< -o $@

reldbg: $(TARGET_RELDBG)

$(TARGET_RELDBG): $(OBJS_RELDBG)
	@mkdir -p $(BIN_DIR)
	ar rcs $@ $^

$(OBJ_DIR)/%.reldbg.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_RELDBG) $(CFLAGS) -c $< -o $@

debug: $(TARGET_DBG)

$(TARGET_DBG): $(OBJS_DBG)
	@mkdir -p $(BIN_DIR)
	ar rcs $@ $^

$(OBJ_DIR)/%.dbg.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_DBG) $(CFLAGS) -c $< -o $@

# Rule to regenerate the assembly dumps
asm:
	@python3 scripts/asm.py

# Rule to check the tracked dumps against a fresh generation
asm-check:
	@python3 scripts/asm.py --check

distclean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)

# Clean target
clean:
	@rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/*
