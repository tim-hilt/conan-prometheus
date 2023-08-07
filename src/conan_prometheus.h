#pragma once

#include <vector>
#include <string>


#ifdef _WIN32
  #define CONAN_PROMETHEUS_EXPORT __declspec(dllexport)
#else
  #define CONAN_PROMETHEUS_EXPORT
#endif

CONAN_PROMETHEUS_EXPORT void conan_prometheus();
CONAN_PROMETHEUS_EXPORT void conan_prometheus_print_vector(const std::vector<std::string> &strings);
