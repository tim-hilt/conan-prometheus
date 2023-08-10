# WARN: When switching to a newer debian base-image, the runner-image should be adjusted too
FROM python:3.11-bookworm as builder

WORKDIR /app
COPY . .

RUN apt update -y && \
    apt upgrade -y && \
    apt install -y cmake && \
    pip install conan && \
    conan profile detect && \
    conan install . --build=missing && \
    cmake --preset conan-release && \
    cmake --build --preset conan-release

FROM debian:bookworm-slim

COPY --from=builder /app/build/Release/conan_prometheus /app

CMD ["/app"]