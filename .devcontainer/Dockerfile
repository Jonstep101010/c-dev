# these variables are only modified from the docker-compose.yml file
ARG ARCH=amd64
ARG base_img=mcr.microsoft.com/vscode/devcontainers/base:dev-bullseye

FROM --platform=linux/${ARCH} ${base_img} AS builder_install
RUN apt-get update --fix-missing && apt-get -y upgrade
RUN apt-get install -y --no-install-recommends \
	gnupg2 \
	build-essential \
	clang \
	make \
	valgrind \
	gdb \
	apt-utils \
	curl \
	cmake \
	gcc \
	locales \
	gcovr \
	wget \
	clang-tidy \
	clang-format

# Install Ceedling if BUILD_TESTING is true
ARG BUILD_TESTING=false
ARG CEEDLING_V=ceedling-0.32.0-6113249.gem
COPY ${CEEDLING_V} /tmp
RUN if [ "$BUILD_TESTING" = "true" ]; then \
		apt-get install -y --no-install-recommends ruby-full && \
		gem update && \
		gem install ceedling && \
		cd /tmp && \
		gem install --local ceedling; \
	fi
