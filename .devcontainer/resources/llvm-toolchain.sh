#!/usr/bin/env bash
llvm_version=16
RUN 
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