SRC_DIR := ./src
BUILD_DIR := ./build
BIN_DIR := ./bin
SRCS := $(wildcard $(SRC_DIR)/*.c)
OBJS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/%.o,$(SRCS))
LIBS := $(patsubst $(SRC_DIR)/%.c,$(BUILD_DIR)/lib%.so,$(SRCS))
OUTPUT_BINARY := main  

all: $(BIN_DIR)/$(OUTPUT_BINARY)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	gcc -c $< -o $@

$(BUILD_DIR)/lib%.so: $(BUILD_DIR)/%.o
	gcc -shared $< -o $@

$(BIN_DIR)/$(OUTPUT_BINARY): main.c $(LIBS)
	gcc -o $@ $< -Wl,-rpath=$(BUILD_DIR) -L$(BUILD_DIR) $(patsubst $(BUILD_DIR)/lib%.so,-l%,$(LIBS)) -lm 

clean:
	rm -rf $(BUILD_DIR)/*.o $(BUILD_DIR)/*.so $(BIN_DIR)/*

.PHONY: all clean
