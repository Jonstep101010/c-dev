ARG base_tag=bullseye
FROM --platform=$TARGETPLATFORM mcr.microsoft.com/vscode/devcontainers/base:dev-${base_tag} AS builder_install

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

COPY resources /opt/src/
WORKDIR /opt/src
# install ruby & ceedling (testing framework)
ARG RUBY_VERSION=3.2.2
RUN VERSION=${RUBY_VERSION} './ruby-debian.sh'
# install & alias llvm tools
RUN llvm_version=${llvm_version} './llvm-toolchain.sh'