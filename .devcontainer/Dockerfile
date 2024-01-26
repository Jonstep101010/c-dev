ARG base_tag=alpine
FROM --platform=$TARGETPLATFORM ruby:3.2.3-${base_tag}

RUN apk add --no-cache \
	build-base \
	curl \
	git \
	libxml2-dev \
	libxslt-dev \
	linux-headers \
	llvm17 \
	valgrind \
	clang17-extra-tools
	
RUN gem update --system
RUN gem install ceedling
COPY ./resources/ceedling-0.32.0-6113249.gem /tmp
RUN cd /tmp && gem install --local ceedling
RUN apk add libhistory ncurses-dev pkgconf
RUN apk add --no-cache readline readline-dev
RUN apk add gdb