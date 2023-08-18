cmake_minimum_required(VERSION 3.5)

project(WebRTCVad LANGUAGES C)

file(GLOB_RECURSE sources CONFIGURE_DEPENDS "*.c")
file(GLOB_RECURSE ccsources CONFIGURE_DEPENDS "*.cc")

set_source_files_properties(${ccsources} PROPERTIES LANGUAGE C)

message(STATUS "${sources}" "${ccsources}")

add_library(WebRTCVad SHARED ${sources} ${ccsources})
target_include_directories(WebRTCVad PRIVATE webrtc)

if (WIN32)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_WIN)
endif (WIN32)

if (UNIX)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_POSIX)
endif (UNIX)
