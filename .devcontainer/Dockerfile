ARG base_tag=bullseye \
    ARCH \
    CEEDLING_V=ceedling-0.32.0-6113249.gem \
    base_img=mcr.microsoft.com/vscode/devcontainers/base:dev-${base_tag}

FROM --platform=linux/${ARCH} ${base_img} AS builder_install
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	curl \
	build-essential \
	clang \
	make \
	wget \
	valgrind \
	zsh \
	ruby-full \
	gnupg2 \
	gnupg-agent \
	gdb \
	ca-certificates

# Install Ceedling
COPY ${CEEDLING_V} /tmp
RUN gem update && gem install ceedling
WORKDIR /tmp
RUN gem install --local ceedling