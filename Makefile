DOTFILES=`pwd`

all: 	git-install vim-install zsh-install
clean: 	git-remove vim-remove zsh-remove

git-install:
	ln -sfn ${DOTFILES}/.gitconfig ~/.gitconfig
	ln -sfn ${DOTFILES}/.gitignore ~/.gitignore

git-remove:
	-@rm -f ~/.gitconfig
	-@rm -f ~/.gitignore

vim-install:
	git submodule update --init
	ln -sfn ${DOTFILES}/.vim ~/.vim
	ln -sfn ${DOTFILES}/.vimrc ~/.vimrc

vim-remove:
	-@rm -f ~/.vim
	-@rm -f ~/.vimrc

zsh-install:
	ln -sfn ${DOTFILES}/.zsh ~/.zsh
	ln -sfn ${DOTFILES}/.zshrc ~/.zshrc

zsh-remove:
	-@rm -f ~/.zsh
	-@rm -f ~/.zshrc

.PHONY: all clean
