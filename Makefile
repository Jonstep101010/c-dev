# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jschwabe <jschwabe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/05 10:39:39 by jschwabe          #+#    #+#              #
#    Updated: 2023/11/10 12:27:36 by jschwabe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #


init_docker: 42HOST | envars
	@echo "init_docker: \033[1;31mrunning\033[0m"
	chmod +x ./.devcontainer/setup/init_docker.sh && sh ./.devcontainer/setup/init_docker.sh

42HOST:
	$(ifeq (ls -l ~/goinfre/ | grep $(USER),),,echo "42HOST: \033[1;31mnot found\033[0m")

info: envars devcontainers
	@echo on 42 macs, run "\033[1;31m"make init_docker"\033[0m" to setup docker

envars:
	@echo "setup your PROJ_DIR and EXEC_NAME variables using the file .env.d/60_other_envars.env"

# red color
devcontainers:
	@echo "\n\033[1;31mdevcontainers extension:\033[0m"
	@echo "https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers\n"
	@echo or use the open menu [cmd + p] and type "ext install ms-vscode-remote.remote-containers"

# add vscode code command to path without admin rights (run manually)
vscodepath:
	echo 'code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}' >> ~/.zshrc; exec zsh