FROM debian:stretch-slim

RUN apt-get update && apt-get install -y curl gcc-arm-linux-gnueabihf

RUN curl https://sh.rustup.rs -sSf | sh -s -- -y --default-toolchain stable
ENV PATH $PATH:/root/.cargo/bin
RUN rustup target add arm-unknown-linux-gnueabihf
RUN rustup target add armv7-unknown-linux-gnueabihf

ADD cargo-config.toml /.cargo/config
ENV CC_arm_unknown_linux_gnueabihf arm-linux-gnueabihf-gcc
ENV CC_armv7_unknown_linux_gnueabihf arm-linux-gnueabihf-gcc
ENV CXX_arm_unknown_linux_gnueabihf arm-linux-gnueabihf-g++
ENV CXX_armv7_unknown_linux_gnueabihf arm-linux-gnueabihf-g++
ENV AR_arm_unknown_linux_gnueabihf arm-linux-gnueabihf-ar
ENV AR_armv7_unknown_linux_gnueabihf arm-linux-gnueabihf-ar
