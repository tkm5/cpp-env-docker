FROM ubuntu:latest
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    build-essential \
    cmake \
    clang \
    libssl-dev

WORKDIR /src

RUN chmod +x /src/exec.sh