# these variables are only modified from the docker-compose.yml file
ARG ARCH=amd64
ARG base_img=mcr.microsoft.com/vscode/devcontainers/base:dev-bullseye

FROM --platform=linux/${ARCH} ${base_img} AS builder_install
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	apt-utils \
	make \
	build-essential \
	clang \
	pkg-config \
	unzip \
	gcc \
	bash

# Install Ceedling if BUILD_TESTING is true
ARG BUILD_TESTING=false
ARG CEEDLING_V=ceedling-0.32.0-6113249.gem
COPY ${CEEDLING_V} /tmp
# RUN if [ "$BUILD_TESTING" = "true" ]; then \
# 		gem update && gem install ceedling; \
# 	fi
		#  && \
		# cd /tmp && \
		# gem install --local ceedling; \
# ENV RUBYOPT "-KU -E utf-8:utf-8"

# WORKDIR /workspace/.devcontainer
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
	llvm \
	clangd \
	clang-format \
	git

# Install readline lib
RUN apt-get install -y libreadline-dev
