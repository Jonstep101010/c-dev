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
	llvm \
	clangd \
	pkg-config \
	unzip \
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

ARG BEAR_DLD=false
RUN if [ "$BEAR_DLD" = "true" ]; then \
		cd /tmp && \
		curl 'https://public.am.files.1drv.com/y4mJUzAf3wf0cc9_av2hBWY2JTEG0KbIGgIDdtgBB-56-5R3epULLi2Llg5BjZmFTXLw2F0mpnO6zRPiWa9TXAaI1TqYi1nh0OTNiWmEkGcMK_7Tk7lkm7xognnnY8KgKrwtuFr_NwX-TFzgJ1DE953iWb5AHg2Xiah8TzQLr_a1VKL9F47WRGbD9PN2kToh-wpvxXQ0K3oSLP4RjJxyPYNokCVmRXojXyfdcMUE001tRE?AVOverride=1' \
		-H 'authority: public.am.files.1drv.com' \
		-H 'accept: text/html,application/xhtml+xml,application/xml;q=0.9,image/avif,image/webp,image/apng,*/*;q=0.8,application/signed-exchange;v=b3;q=0.7' \
		-H 'accept-language: en-GB,en;q=0.9,de-DE;q=0.8,de;q=0.7,en-US;q=0.6,es;q=0.5' \
		-H 'dnt: 1' \
		-H 'referer: https://onedrive.live.com/' \
		-H 'sec-ch-ua: "Google Chrome";v="117", "Not;A=Brand";v="8", "Chromium";v="117"' \
		-H 'sec-ch-ua-mobile: ?0' \
		-H 'sec-ch-ua-platform: "macOS"' \
		-H 'sec-fetch-dest: iframe' \
		-H 'sec-fetch-mode: navigate' \
		-H 'sec-fetch-site: cross-site' \
		-H 'sec-fetch-user: ?1' \
		-H 'upgrade-insecure-requests: 1' \
		-H 'user-agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36' \
		--compressed --output Bear-3.1.3.zip && \
		unzip Bear-3.1.3.zip; \
	fi

ARG BEAR_INSTALL=true
RUN if [ "$BEAR_INSTALL" = "true" ]; then \
		cd tmp/Bear-3.1.3 && \
		sudo cmake -DENABLE_UNIT_TESTS=OFF -DENABLE_FUNC_TESTS=OFF $BEAR_SOURCE_DIR && \
		sudo make all && \
		sudo make install; \
	fi