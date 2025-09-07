SRC_DIR    := src
LIB_DIR    := lib
BUILD_DIR  := build

CXX        := g++
CXXFLAGS   := -Wall -Wextra -pedantic -std=c++17 -O2 -g -I$(LIB_DIR)
LD         := $(CXX)
LDFLAGS    := -lraylib -lGL -lm -lpthread -ldl -lrt

TARGET     := $(BUILD_DIR)/my_app

MAIN_OBJ   := $(BUILD_DIR)/my_app.o
LIB_OBJS := $(BUILD_DIR)/grid.o


OBJS := $(MAIN_OBJ) $(LIB_OBJS)

all: $(TARGET)

$(TARGET): $(OBJS)
	$(LD) -o $@ $^ $(LDFLAGS)

$(BUILD_DIR)/my_app.o: $(SRC_DIR)/my_app.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR)/grid.o: $(LIB_DIR)/grid.cpp | $(BUILD_DIR)
	$(CXX) $(CXXFLAGS) -c -o $@ $<

$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)

run: $(TARGET)
	./$(TARGET)

.PHONY: all clean run