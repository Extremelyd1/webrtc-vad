SOURCES = $(shell find . -type f -iname '*.c')
HEADERS = $(shell find . -type f -iname '*.h')
OBJECTS = $(SOURCES:.c=.o)

build:
	gcc -shared -Iwebrtc -fPIC -o webrtcvad $(SOURCES)
