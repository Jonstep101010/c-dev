ARG base_tag=bullseye
# FROM --platform=$TARGETPLATFORM mcr.microsoft.com/vscode/devcontainers/base:dev-${base_tag} AS builder_install
FROM --platform=$TARGETPLATFORM mcr.microsoft.com/devcontainers/ruby:1-${base_tag} AS builder_install
ARG base_tag=bullseye
ARG llvm_version=16
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/${base_tag}/ llvm-toolchain-${base_tag}-${llvm_version} main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update --fix-missing && apt-get -y upgrade

RUN apt-get install -y --no-install-recommends \
	apt-utils software-properties-common \
	gnupg2 gnupg-agent ca-certificates \
	make automake autoconf \
	libc6-dbg valgrind \
	zsh

# COPY resources/ruby-debian.sh /opt/src/ruby-debian.sh
# # install ruby & ceedling (testing framework)
# ARG RUBY_VERSION=3.2.2
# ENV VERSION=${RUBY_VERSION}
# RUN bash -c '/opt/src/ruby-debian.sh'
# install & alias llvm tools
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	clang-${llvm_version} \
	clangd-${llvm_version} \
    clang-format-${llvm_version} \
    lldb-${llvm_version} \
    clang-tidy-${llvm_version}
RUN ln -s /usr/bin/clang-format-${llvm_version} /usr/local/bin/clang-format
RUN ln -s /usr/bin/clang-tidy-${llvm_version} /usr/local/bin/clang-tidy
RUN ln -s /usr/bin/clang-${llvm_version} /usr/bin/clang
RUN ln -s /usr/bin/clangd-${llvm_version} /usr/bin/clangd
RUN ln -s /usr/bin/lldb-${llvm_version} /usr/bin/lldb

COPY resources/ceedling-0.32.0-6113249.gem /opt/src/ceedling-0.32.0-6113249.gem
RUN gem update
RUN gem update --system
RUN gem install ceedling
RUN cd /opt/src && gem install --local ceedling