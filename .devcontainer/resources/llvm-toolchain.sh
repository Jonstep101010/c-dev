llvm_version=$1
apt-get install -y --no-install-recommends
	clang-${llvm_version} \
	clangd-${llvm_version} \
    clang-format-${llvm_version} \
    lldb-${llvm_version} \
    lldb-server-${llvm_version} \
    lldb-vscode-${llvm_version} \
    clang-tidy-${llvm_version}

ln -s /usr/bin/clang-format-${llvm_version} /usr/local/bin/clang-format
ln -s /usr/bin/clang-tidy-${llvm_version} /usr/local/bin/clang-tidy
ln -s /usr/bin/clang-${llvm_version} /usr/bin/clang
ln -s /usr/bin/clangd-${llvm_version} /usr/bin/clangd
ln -s /usr/bin/lldb-${llvm_version} /usr/bin/lldb
ln -s /usr/bin/lldb-server-${llvm_version} /usr/bin/lldb-server
ln -s /usr/bin/lldb-vscode-${llvm_version} /usr/bin/lldb-vscode