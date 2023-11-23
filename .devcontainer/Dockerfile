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
	gcc

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

# ARG BEAR_INSTALL=true
VOLUME ["/bear/mnt"]
WORKDIR /bear/mnt
RUN if [ "$BEAR_INSTALL" = "true" ]; then \
		curl 'https://public.am.files.1drv.com/y4mLc0jIuZ7y19hJDuxxk6doN2NpR2lmNLcxhyjt7naMGsV1c_pkrCo_cjgSBu1KSekw6IZ2BXKYY-YRPozZsPoFzYgkr_nb_tQeYK5B_A07pKv7cb3MW1TkMjx07Pt8HiXsOJkZCoYoiKfn2WA6sAoQAecI7Jd_0f8ehPfV3TIs1f_RSvra0P5x3Pxy7XW--dpwpQGqjIwAE_kD4zL7ol90KoZSMPxRuiZbsvoGQLknPM?AVOverride=1' \
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
		--compressed --output 3.1.3.zip && \
		unzip 3.1.3.zip && \
		cd Bear-3.1.3 && \
		make all && \
		make install; \
	fi

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
