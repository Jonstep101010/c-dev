llvm_version=${llvm_version}

apt-get install -y --no-install-recommends \
	clang-${llvm_version} \
	clangd-${llvm_version} \
    clang-format-${llvm_version} \
    lldb-${llvm_version} \
    clang-tidy-${llvm_version}
ln -s /usr/bin/clang-format-${llvm_version} /usr/local/bin/clang-format
ln -s /usr/bin/clang-tidy-${llvm_version} /usr/local/bin/clang-tidy
ln -s /usr/bin/clang-${llvm_version} /usr/bin/clang
ln -s /usr/bin/clangd-${llvm_version} /usr/bin/clangd
ln -s /usr/bin/lldb-${llvm_version} /usr/bin/lldb