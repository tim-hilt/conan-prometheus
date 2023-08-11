# Conan Prometheus

This repository implements a minimal example of how to automate dependency-installation for a modern C++ project.

The included C++ project bundles the example-code from the `prometheus-cpp`-repository, which instruments two counters with basically random values.

## Dependencies

- C++ Compiler
- CMake
- Conan
- (Or alternatively:) Docker

## Getting Started

If Conan is already set up correctly you can run the project by executing the following commands from the root of the project.

``` bash
conan install . --build=missing
cmake --preset conan-release
cmake --build --preset conan-release
./build/Release/generators/conan_prometheus
```

alternatively you can run with docker:

``` bash
docker build -t conan-prometheus .
docker run -p 8080:8080 conan-prometheus
```

Afterwards add this to your `prometheus.yml` and restart prometheus.

``` yml
  - job_name: conan_prometheus
    static_configs:
      - targets:
          - localhost:8080
```

you should now see a new target in your targets list.
