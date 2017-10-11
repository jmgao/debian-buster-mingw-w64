FROM debian:buster
MAINTAINER Josh Gao

RUN dpkg --add-architecture i386 && \
    apt-get -qq update && \
    apt-get install -y --no-install-recommends build-essential ninja-build python3-pip python3-setuptools mingw-w64 wine wine32 wine64 && \
    apt-get clean && \
    pip3 install meson
RUN wine net || true
