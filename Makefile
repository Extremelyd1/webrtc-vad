SOURCES = $(shell find . -type f -iname '*.c')
HEADERS = $(shell find . -type f -iname '*.h')
OBJECTS = $(SOURCES:.c=.o)

build:
	gcc -shared -I. -fPIC -o webrtcvad $(SOURCES)
