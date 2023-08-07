#include "conan_prometheus.h"
#include <vector>
#include <string>

int main() {
    conan_prometheus();

    std::vector<std::string> vec;
    vec.push_back("test_package");

    conan_prometheus_print_vector(vec);
}
