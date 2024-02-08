FROM --platform=$TARGETPLATFORM mcr.microsoft.com/devcontainers/ruby:3.2-bookworm

# add apt sources for llvm
RUN curl -fsSL https://apt.llvm.org/llvm-snapshot.gpg.key | apt-key add -
RUN echo "deb http://apt.llvm.org/bookworm/ llvm-toolchain-bookworm-17 main" >> /etc/apt/sources.list.d/llvm.list
RUN apt-get update --fix-missing && apt-get -y upgrade

# install dependencies
RUN apt-get install -y wget gnupg gnupg2 gdb

# install & alias llvm tools
RUN apt-get install -y --no-install-recommends \
	clang-17 \
	clangd-17 \
    clang-format-17 \
    clang-tidy-17
RUN ln -s /usr/bin/clang-format-17 /usr/local/bin/clang-format
RUN ln -s /usr/bin/clang-tidy-17 /usr/local/bin/clang-tidy
RUN ln -s /usr/bin/clang-17 /usr/bin/clang
RUN ln -s /usr/bin/clangd-17 /usr/bin/clangd

# install ceedling for testing
COPY resources/ceedling-0.32.0-6113249.gem /opt/src/ceedling-0.32.0-6113249.gem
RUN gem update --system
RUN gem install ceedling
RUN cd /opt/src && gem install --local ceedling

# install additional tools...
RUN apt-get install -y libreadline-dev
