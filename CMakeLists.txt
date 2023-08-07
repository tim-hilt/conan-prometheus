cmake_minimum_required(VERSION 3.15)
project(conan_prometheus CXX)

find_package(prometheus-cpp CONFIG REQUIRED)
add_executable(conan_prometheus src/conan_prometheus.cpp src/main.cpp)

install(TARGETS conan_prometheus DESTINATION "."
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        )
