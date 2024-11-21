FROM ubuntu:latest
RUN apt update && \
    DEBIAN_FRONTEND=noninteractive \
    apt install -y \
    build-essential \
    cmake \
    clang \
    libssl-dev

WORKDIR /src
COPY exec.sh /src/exec.sh

RUN chmod +x /src/exec.sh