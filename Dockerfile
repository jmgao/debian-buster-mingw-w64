FROM debian:buster
MAINTAINER Josh Gao

RUN echo 'APT::Install-Recommends "false";' >> /etc/apt/apt.conf.d/99recommends
RUN echo 'APT::Get::Assume-Yes "true";' >> /etc/apt/apt.conf.d/99assumeyes
RUN dpkg --add-architecture i386 && apt-get update
RUN apt-get install git ssh make ninja-build python3-pip python3-setuptools && \
    apt-get install gnupg software-properties-common && \
    apt-get clean

RUN apt-get install mingw-w64 wine32 wine64 && apt-get clean

ADD llvm-snapshot.gpg.key /tmp/llvm-snapshot.gpg.key
RUN apt-key add /tmp/llvm-snapshot.gpg.key
RUN apt-add-repository 'deb http://apt.llvm.org/unstable/ llvm-toolchain main'
RUN apt-get update
RUN apt-get install clang-8 && apt-get clean
RUN ln -s /usr/bin/clang-8 /usr/bin/clang
RUN ln -s /usr/bin/clang++-8 /usr/bin/clang++

RUN CC=clang pip3 install git+https://github.com/jmgao/meson.git@clang-mingw
