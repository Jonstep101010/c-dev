ARG base_tag=bullseye
FROM --platform=$TARGETPLATFORM ruby:3.2.2-${base_tag} AS builder_ruby_image

ARG base_tag=bullseye
ARG llvm_version=16
# add apt sources for llvm
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/${base_tag}/ llvm-toolchain-${base_tag}-${llvm_version} main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update --fix-missing && apt-get -y upgrade

# install dependencies
RUN apt-get install -y wget gnupg gnupg2 gdb

# install & alias llvm tools
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

# install ceedling for testing
COPY resources/ceedling-0.32.0-6113249.gem /opt/src/ceedling-0.32.0-6113249.gem
RUN gem update --system
RUN gem install ceedling
RUN cd /opt/src && gem install --local ceedling

# install additional tools...