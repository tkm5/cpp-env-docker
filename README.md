# C++ Development Environment with Docker

This repository provides a C++ development environment using Docker Compose.

## Usage

### Setting up the Environment

```bash
docker compose up -d
```

### Entering the Container

```bash
docker compose exec cpp_dev bash
```

### Compiling

```bash
./exec.sh <executable_name>
```

`file_name` is a variable, so you can change the executable name as needed.  For example, to compile `main.cpp` into an executable named `my_program`:

```bash
./exec.sh my_program
```

The compiled executable will be created in the `/src` directory inside the container.

## Dockerfile Explanation

The `Dockerfile` installs the necessary packages for C++ development (`build-essential`, `cmake`, `clang`, `libssl-dev`, `git`, `binutils`, `libc6-dev`, `gdb`) on top of the latest Ubuntu image. It also removes unnecessary files to reduce the image size.

`WORKDIR` sets the working directory to `/src`, and the `COPY` instruction copies the files from the current directory to the `/src` directory inside the container.

## docker-compose.yml Explanation

The `docker-compose.yml` file defines a service named `cpp_dev`.  The `build` directive specifies the `Dockerfile`, and the `volumes` directive mounts the current directory on the host machine to the `/src` directory inside the container.  This allows you to edit source code on your host machine and have the changes reflected within the container.


## exec.sh Explanation

`exec.sh` is a shell script for compiling C++ source code. It takes the executable name as the first argument.

```bash
#!/bin/sh

EXEC_NAME=$1
g++ main.cpp -o $EXEC_NAME && ./$EXEC_NAME
```

## Notes

* Ensure that `main.cpp` exists inside the container.
* `exec.sh` requires the executable name as the first argument.  Omitting the argument will result in an error.


Use this README.md as a guide to set up your C++ development environment.  You might need to adjust the `exec.sh` script depending on your specific build requirements.  For more complex projects, consider using a dedicated build system like CMake.
