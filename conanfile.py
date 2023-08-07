from conan import ConanFile
from conan.tools.cmake import CMake, CMakeDeps, CMakeToolchain, cmake_layout


class conan_prometheusRecipe(ConanFile):
    name = "conan_prometheus"
    version = "1.0.0"
    package_type = "application"

    # Optional metadata
    license = "MIT"
    author = "Tim Hilt timhilt@live.de"
    url = "https://github.com/tim-hilt/cpp-prometheus"
    description = "POC on how to use conan for automating the installation of cpp-dependencies"
    topics = ("automation", "prometheus", "containerization")

    # Binary configuration
    settings = "os", "compiler", "build_type", "arch"

    # Sources are located in the same place as this recipe, copy them to the recipe
    exports_sources = "CMakeLists.txt", "src/*"

    def requirements(self):
        self.requires("prometheus-cpp/1.1.0")

    def layout(self):
        cmake_layout(self)

    def generate(self):
        deps = CMakeDeps(self)
        deps.generate()
        tc = CMakeToolchain(self)
        tc.generate()

    def build(self):
        cmake = CMake(self)
        cmake.configure()
        cmake.build()

    def package(self):
        cmake = CMake(self)
        cmake.install()
