cmake_minimum_required (VERSION 3.8)

project(VideoEditor CXX)
set(CMAKE_CXX_STANDARD 14)

add_executable(VideoEditor src/main.cpp)
set_target_properties(VideoEditor PROPERTIES RUNTIME_OUTPUT_DIRECTORY dist)
