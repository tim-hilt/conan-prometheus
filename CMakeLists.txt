cmake_minimum_required(VERSION 3.15)
project(conan_prometheus CXX)

find_package(prometheus-cpp CONFIG REQUIRED)

add_executable(${PROJECT_NAME} src/main.cpp)
target_link_libraries(${PROJECT_NAME} PRIVATE prometheus-cpp::pull)

install(TARGETS ${PROJECT_NAME} DESTINATION "."
        RUNTIME DESTINATION bin
        ARCHIVE DESTINATION lib
        LIBRARY DESTINATION lib
        )
