SOURCES = $(shell find . -type f -iname '*.c')

build:
	gcc -shared -Iwebrtc -fPIC -o webrtcvad $(SOURCES)
