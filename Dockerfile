FROM jmgao/debian-buster-mingw-w64:latest
MAINTAINER Josh Gao

RUN apt-get install curl
RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain nightly

ENV PATH "$PATH:/root/.cargo/bin"

RUN rustup target add i686-pc-windows-gnu && \
    rustup target add x86_64-pc-windows-gnu && \
    rustup component add rustfmt
