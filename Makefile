TARGET = main
LIBS = -lwayland-client
CC = clang
CFLAGS = $(shell objfw-config --all) -v -g

.PHONY: default all clean

default: $(TARGET)
all: default

OBJECTS = $(patsubst %.m, %.o, $(wildcard *.m))
HEADERS = $(wildcard *.h)

%.o: %.m $(HEADERS)
	$(CC) $(CFLAGS) -c $< -o $@

.PRECIOUS: $(TARGET) $(OBJECTS)

$(TARGET): $(OBJECTS)
	$(CC) $(OBJECTS) $(CFLAGS) $(LIBS) -o $@

clean:
	-rm -f *.o
	-rm -f $(TARGET)
