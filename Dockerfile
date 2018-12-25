FROM jmgao/debian-buster-mingw-w64:latest
MAINTAINER Josh Gao

ADD llvm-snapshot.gpg.key /tmp/llvm-snapshot.gpg.key
RUN apt-key add /tmp/llvm-snapshot.gpg.key
RUN apt-add-repository 'deb http://apt.llvm.org/unstable/ llvm-toolchain main'
RUN apt-get update
RUN apt-get install clang-8 && apt-get clean
RUN ln -s /usr/bin/clang-8 /usr/bin/clang
RUN ln -s /usr/bin/clang++-8 /usr/bin/clang++

RUN CC=clang pip3 install git+https://github.com/mesonbuild/meson.git@0.49.0
