cmake_minimum_required(VERSION 3.10)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

project(WebRTCVad LANGUAGES C CXX)

file(GLOB_RECURSE sources CONFIGURE_DEPENDS "webrtc/*.c")
file(GLOB_RECURSE ccsources CONFIGURE_DEPENDS "webrtc/*.cc")

#set_source_files_properties(${ccsources} PROPERTIES LANGUAGE C)

message(STATUS "${sources}" "${ccsources}")

add_library(WebRTCVad SHARED ${sources} ${ccsources})
target_include_directories(WebRTCVad PRIVATE webrtc)

if (WIN32)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_WIN)
endif (WIN32)

if (UNIX)
	target_compile_definitions(WebRTCVad PRIVATE WEBRTC_POSIX)
endif (UNIX)

add_subdirectory(abseil-cpp)
target_link_libraries(WebRTCVad absl::base absl::strings)
