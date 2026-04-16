# Compiler
CC := clang

# Default CFLAGS
CFLAGS := -DJUMP_MODE=0 -DDECODE_MODE=0

# Compiler flags
_CFLAGS := -Wall -Wextra -O3 -std=c2x -DNDEBUG
_LDFLAGS := 

_CFLAGS_RELDBG := -Wall -Wextra -O3 -ggdb3 -std=c2x -DNDEBUG
_LDFLAGS_RELDBG :=

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

# Binary name
TARGET := $(BIN_DIR)/quickaml

TARGET_RELDBG := $(TARGET).reldbg

TARGET_DBG := $(TARGET).dbg

# Phony targets (non-file targets)
.PHONY: all rel run reldbg runreldbg debug rundbg distclean clean

# Default target
all: $(TARGET) $(TARGET_RELDBG) $(TARGET_DBG)

rel: $(TARGET)

# Rule to run the program
run: $(TARGET)
	$(TARGET)

# Rule to create the binary
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(_CFLAGS) $(CFLAGS) $(_LDFLAGS) $(LDFLAGS) $^ -o $@

$(OBJ_DIR)/vm.s: $(SRC_DIR)/vm.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS) $(CFLAGS) -S $< -o $@

$(OBJ_DIR)/vm.o: $(OBJ_DIR)/vm.s $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS) $(CFLAGS) -c $< -o $@

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS) $(CFLAGS) -c $< -o $@

reldbg: $(TARGET_RELDBG)

runreldbg: $(TARGET_RELDBG)
	$(TARGET_RELDBG)

$(TARGET_RELDBG): $(OBJS_RELDBG)
	@mkdir -p $(BIN_DIR)
	$(CC) $(_CFLAGS_RELDBG) $(CFLAGS) $(_LDFLAGS_RELDBG) $(LDFLAGS) $^ -o $@

$(OBJ_DIR)/vm.reldbg.s: $(SRC_DIR)/vm.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_RELDBG) $(CFLAGS) -S $< -o $@

$(OBJ_DIR)/vm.reldbg.o: $(OBJ_DIR)/vm.reldbg.s $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_RELDBG) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.reldbg.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_RELDBG) $(CFLAGS) -c $< -o $@

debug: $(TARGET_DBG)

rundbg: $(TARGET_DBG)
	$(TARGET_DBG)

$(TARGET_DBG): $(OBJS_DBG)
	@mkdir -p $(BIN_DIR)
	$(CC) $(_CFLAGS_DBG) $(CLFAGS) $(LDFLAGS) $^ -o $@

$(OBJ_DIR)/vm.dbg.s: $(SRC_DIR)/vm.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_DBG) $(CFLAGS) -S $< -o $@

$(OBJ_DIR)/vm.dbg.o: $(OBJ_DIR)/vm.dbg.s $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_DBG) $(CFLAGS) -c $< -o $@

$(OBJ_DIR)/%.dbg.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(_CFLAGS_DBG) $(CFLAGS) -c $< -o $@

distclean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)

# Clean target
clean:
	@rm -rf $(OBJ_DIR)/*.o $(BIN_DIR)/*
