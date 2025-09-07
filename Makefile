SRC_DIR    := src
LIB_DIR := lib
BUILD_DIR  := build

CXX        := g++
CXXFLAGS   := -Wall -Wextra -pedantic -std=c++17 -O2 -g -I$(LIB_DIR)
LD         := $(CXX)
LDFLAGS := -lraylib -lGL -lm -lpthread -ldl -lrt

TARGET     := $(BUILD_DIR)/my_app
OBJS       := $(BUILD_DIR)/my_app.o \
              #$(BUILD_DIR)/print_lib.o

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

$(BUILD_DIR)/%.o: $(SRC_DIR)/%.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

#$(BUILD_DIR)/print.o: $(LIB_DIR)/print.cpp | $(BUILD_DIR)
#$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run