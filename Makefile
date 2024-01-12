LLVM_VER = 16
BASE_IMG_TAG = bookworm

# build using simple defaults
build:
	zsh -c 'cd .devcontainer; docker build --build-arg llvm_version=$(LLVM_VER) --build-arg base_tag=$(BASE_IMG_TAG) .'

# build using compose
compose-build:
	zsh -c 'cd .devcontainer; docker compose up -d'

# build devcontainer using cli, if installed
devcontainer:
	zsh -c 'devcontainer build .'

# initialize goinfre
init:
	./resources/scripts/init_docker.sh