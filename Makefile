install-fonts:
	mkdir -p ~/.local/share/fonts/p10k
	cp fonts/* ~/.local/share/fonts/p10k 
	fc-cache -f -v

ZDOTDIR ?= ~/.config/zsh

install-zsh:
	mkdir -p $(ZDOTDIR)
	cp -r zsh/config/zsh ~/.config/
	cp -r zsh/.zshenv ~/
	git clone --depth=1 https://github.com/mattmc3/antidote.git $(ZDOTDIR)/.antidote

install-git:
	mkdir -p ~/.config
	cp -r git ~/.config/

