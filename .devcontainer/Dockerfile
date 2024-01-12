# these variables are only modified from the docker-compose.yml file
ARG ARCH=amd64
ARG base_img=mcr.microsoft.com/vscode/devcontainers/base:dev-bullseye

FROM --platform=linux/${ARCH} ${base_img} AS builder_install
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	apt-utils \
	make \
	build-essential \
	pkg-config \
	unzip \
	gcc \
	bash

RUN apt-get install -y --no-install-recommends \
	gnupg2 \
	ca-certificates \
	valgrind \
	gdb \
	curl \
	locales \
	gcovr \
	wget \
	clang-tidy \
	clang-format \
	git

# install dependencies & clang tools
RUN	apt install -y lsb-release wget software-properties-common gnupg
RUN bash -c "$(wget -O - https://apt.llvm.org/llvm.sh)"

# Install readline lib
RUN apt-get install -y libreadline-dev

# install ruby & ceedling (testing framework)
COPY ceedling-0.32.0-6113249.gem /opt/src/
COPY library-scripts/ruby-debian.sh /opt/src/scripts/ruby-debian.sh
RUN /bin/bash -c '/opt/src/scripts/ruby-debian.sh'

# install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-Linux-x86_64.sh \
		-q -O /tmp/cmake-install.sh \
		&& chmod u+x /tmp/cmake-install.sh \
		&& mkdir /opt/cmake-3.28.1 \
		&& /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.28.1 \
		&& rm /tmp/cmake-install.sh \
		&& ln -s /opt/cmake-3.28.1/bin/* /usr/bin