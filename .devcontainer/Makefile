# **************************************************************************** #
#                                                                              #
#                                                         :::      ::::::::    #
#    Makefile                                           :+:      :+:    :+:    #
#                                                     +:+ +:+         +:+      #
#    By: jschwabe <jschwabe@student.42.fr>          +#+  +:+       +#+         #
#                                                 +#+#+#+#+#+   +#+            #
#    Created: 2023/11/05 10:39:39 by jschwabe          #+#    #+#              #
#    Updated: 2023/11/05 11:29:30 by jschwabe         ###   ########.fr        #
#                                                                              #
# **************************************************************************** #

info: envars devcontainers
	@echo on 42 macs, run "\033[1;31m"make init_docker"\033[0m" to setup docker

envars:
	@echo "setup your PROJ_DIR and EXEC_NAME variables using the file .env.d/60_other_envars.env"

# red color
devcontainers:
	@echo "\n\033[1;31mdevcontainers extension:\033[0m"
	@echo "https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers\n"
	

init_docker:
	chmod +x ./setup/init_docker.sh && sh ./setup/init_docker.sh

# add vscode code command to path without admin rights (run manually)
vscodepath:
	echo 'code () { VSCODE_CWD="$PWD" open -n -b "com.microsoft.VSCode" --args $* ;}' >> ~/.zshrc; exec zsh