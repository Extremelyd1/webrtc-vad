SOURCES = $(shell find . -type f -iname '*.c')

build:
	gcc -v -shared -Iwebrtc -fPIC -o webrtcvad $(SOURCES)
