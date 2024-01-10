# these variables are only modified from the docker-compose.yml file
ARG base_tag=bullseye
ARG ARCH=amd64
ARG base_img=mcr.microsoft.com/vscode/devcontainers/base:dev-${base_tag}

FROM --platform=linux/${ARCH} ${base_img} AS builder_install
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	apt-utils \
	make \
	build-essential \
	clang \
	pkg-config \
	unzip \
	gnupg2 \
	ca-certificates \
	curl \
	locales \
	gcovr \
	wget \
	git \
	zsh \
	lsb-release \
	software-properties-common \
	bash \
	libc6-dbg \
	gnupg2 \
	ca-certificates \
	valgrind \
	gdb \
	curl \
	locales \
	gcovr \
	wget \
	git \
	lsb-release \
	wget \
	software-properties-common \
	&& rm -rf /var/lib/apt/lists/*

# install ruby & ceedling (testing framework)
COPY ceedling-0.32.0-6113249.gem /opt/src/
COPY library-scripts/ruby-debian.sh /opt/src/scripts/ruby-debian.sh
ARG RUBY_VERSION=3.2.2
ENV VERSION=${RUBY_VERSION}
RUN /bin/bash -c '/opt/src/scripts/ruby-debian.sh'

# install dependencies & clang tools
ARG base_tag=bullseye
ARG llvm_version=16
RUN curl --fail --silent --show-error --location https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/$base_tag/ llvm-toolchain-$base_tag-${llvm_version} main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update --fix-missing && apt-get -y upgrade

# install & alias llvm tools
RUN apt-get install -y --no-install-recommends \
	clang-${llvm_version} \
	clangd-${llvm_version} \
    clang-format-${llvm_version} \
    clang-tidy-${llvm_version} \
    && rm -rf /var/lib/apt/lists/*
RUN ln -s /usr/bin/clang-format-${llvm_version} /usr/local/bin/clang-format
RUN ln -s /usr/bin/clang-tidy-${llvm_version} /usr/local/bin/clang-tidy
RUN ln -s /usr/bin/clang-${llvm_version} /usr/bin/clang
RUN ln -s /usr/bin/clangd-${llvm_version} /usr/bin/clangd
RUN ln -s /usr/bin/lldb-${llvm_version} /usr/bin/lldb

# install valgrind from source
ADD 'https://sourceware.org/pub/valgrind/valgrind-3.22.0.tar.bz2' /tmp/valgrind.tar.bz2
RUN cd /tmp && tar -xvf valgrind.tar.bz2 && cd valgrind-3.22.0 && ./configure && make && make install

# install cmake
RUN wget https://github.com/Kitware/CMake/releases/download/v3.28.1/cmake-3.28.1-Linux-x86_64.sh \
		-q -O /tmp/cmake-install.sh \
		&& chmod u+x /tmp/cmake-install.sh \
		&& mkdir /opt/cmake-3.28.1 \
		&& /tmp/cmake-install.sh --skip-license --prefix=/opt/cmake-3.28.1 \
		&& rm /tmp/cmake-install.sh \
		&& ln -s /opt/cmake-3.28.1/bin/* /usr/bin
