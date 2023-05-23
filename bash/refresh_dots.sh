#!/bin/bash

# Refresh dotfiles repo in Documents/projects/dotfiles
function refresh_dots() {
	# Go to root
	cd ~

	# Refresh Brewfile
	rm Brewfile
	HOMEBREW_NO_AUTO_UPDATE=1 brew bundle dump

	# Copy main dotfiles
	cp .bash_prompt .bash_profile .bashrc .aliases .exports .functions .gitconfig .gitignore_global .git-completion.bash .hushlogin .inputrc .vimrc Brewfile .tmux.conf Documents/code/projects/dotfiles

	# VSCode
	cp ~/Library/Application\ Support/Code/User/{settings.json,keybindings.json} Documents/code/projects/dotfiles/vscode
	cp -R ~/Library/Application\ Support/Code/User/snippets Documents/code/projects/dotfiles/vscode

	# Go to dotfiles folder
	cd ~/Documents/code/projects/dotfiles
}