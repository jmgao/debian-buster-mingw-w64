FROM debian:buster
MAINTAINER Josh Gao

RUN dpkg --add-architecture i386
RUN apt-get -qq update
RUN apt-get install -y mingw-w64 ninja-build python3-pip
RUN pip3 install meson
RUN apt-get install -y wget flex bison
RUN cd /root && wget http://dl.winehq.org/wine/source/2.x/wine-2.18.tar.xz && tar xfv wine-2.18.tar.xz && cd wine-2.18 && ./configure --disable-win16 --enable-win64 --without-x --without-freetype && make && make install && cd /root && rm -rf wine-2.18 wine-2.18.tar.xz
RUN  wine64 net || true
