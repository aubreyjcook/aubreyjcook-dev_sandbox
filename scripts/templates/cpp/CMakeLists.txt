cmake_minimum_required(VERSION 3.16)
project(__NAME__ LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

add_executable(__NAME__ src/main.cpp)
