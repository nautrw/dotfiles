endeavour:
	yay -S tree zsh flatpak foot exa bat ttf-jetbrains-mono-nerd neovim ripgrep wl-clipboard xclip lazygit nodejs npm btop
	git clone https://github.com/nautrw/nvim ~/.config/nvim
	mkdir ~/.zsh
	git clone https://github.com/marlonrichert/zsh-autocomplete ~/.zsh/zsh-autocomplete
	git clone https://github.com/zsh-users/zsh-syntax-highlighting ~/.zsh/zsh-syntax-highlighting
	mv .config/* ~/.config
	mv ./.zshrc ~/.zshrc
	chsh -s /bin/zsh
	echo "Installation complete! You should reboot your computer (run 'reboot') for the changes to take place."

uninstall:
	rm -rf ~/.zsh ~/.zshrc ~/.config/nvim ~/.config/fontconfig ~/.config/foot ~/.local/share/nvim ~/.local/state/nvim
