# Compiler
CC := clang

# Compiler flags
CFLAGS := -Wall -Wextra -O3 -march=native -std=c2x # -fsanitize=address

# Directories
SRC_DIR := src
OBJ_DIR := obj
BIN_DIR := bin
INC_DIR := .

# Source files
SRCS := $(wildcard $(SRC_DIR)/*.c)

# Object files
OBJS := $(patsubst $(SRC_DIR)/%.c,$(OBJ_DIR)/%.o,$(SRCS))

# Header files
INCS := $(wildcard $(INC_DIR)/*.h)

# Binary name
TARGET := $(BIN_DIR)/quickaml

# Phony targets (non-file targets)
.PHONY: all clean

# Default target
all: $(TARGET)

# Rule to create the binary
$(TARGET): $(OBJS)
	@mkdir -p $(BIN_DIR)
	$(CC) $(CFLAGS) $^ -o $@

# Rule to compile source files into object files
$(OBJ_DIR)/%.o: $(SRC_DIR)/%.c $(INCS)
	@mkdir -p $(OBJ_DIR)
	$(CC) $(CFLAGS) -c $< -o $@

# Clean target
clean:
	@rm -rf $(OBJ_DIR) $(BIN_DIR)
