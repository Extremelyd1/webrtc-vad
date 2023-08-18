cmake_minimum_required(VERSION 3.5)

project(WebRTCVad LANGUAGES C)

file(GLOB_RECURSE sources CONFIGURE_DEPENDS "*.c" "*.cc")

add_library(WebRTCVad SHARED ${sources})
target_include_directories(WebRTCVad PRIVATE webrtc)

if (WIN32)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_WIN)
endif (WIN32)

if (UNIX)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_POSIX)
endif (UNIX)
