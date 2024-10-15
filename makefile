endeavour:
	yay -S zsh kitty exa bat ttf-jetbrains-mono-nerd neovim ripgrep wl-clipboard xclip
	git clone https://github.com/nautrw/nvim ~/.config/nvim
	mkdir ~/.zsh
	git clone https://github.com/marlonrichert/zsh-autocomplete ~/.zsh/zsh-autocomplete
	cd ~/.zsh/zsh-autocomplete
	git switch -C 196810035992abea65e54852c4278af2069ee482 # use a version that actually works :/
	git clean -df
	cd ~/dotfiles
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	mv .config/* ~/.config
	mv ./.zshrc ~/.zshrc
	chsh -s /bin/zsh
	echo "Installation complete! You should reboot your computer (run 'reboot') for the changes to take place."

uninstall:
	rm -rf ~/.zsh ~/.zshrc ~/.config/nvim ~/.config/fontconfig ~/.config/kitty ~/.local/share/nvim ~/.local/state/nvim
