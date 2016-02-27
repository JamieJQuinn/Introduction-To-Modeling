CC=g++
CFLAGS=-c -std=c++0x -fopenmp
DEBUG_CFLAGS= -DDEBUG -g -pg -Wall
BUILD_CFLAGS= -DNDEBUG -O3
LDFLAGS=-fopenmp
DEBUG_LDFLAGS=-pg
SOURCES=box.cpp 
OBJECTS=$(SOURCES:.cpp=.o)
EXECUTABLE=box

all: $(SOURCES) debug

build: CFLAGS += $(BUILD_CFLAGS)
build: $(EXECUTABLE)

debug: CFLAGS += $(DEBUG_CFLAGS) 
debug: LDFLAGS += $(DEBUG_LDFLAGS) 
debug: $(EXECUTABLE)

$(EXECUTABLE): $(OBJECTS) 
	$(CC) $(LDFLAGS) $(OBJECTS) -o $@

.cpp.o:
	$(CC) $(CFLAGS) $< -o $@

clean:
	rm *.o $(EXECUTABLE)

