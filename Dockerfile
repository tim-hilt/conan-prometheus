FROM python:3.11 as builder

RUN pip install conan

FROM gcr.io/distroless/cc-debian11:nonroot
