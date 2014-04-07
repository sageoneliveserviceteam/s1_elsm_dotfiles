DOTFILES=`pwd`

all: 	git-install vim-install zsh-install
clean: 	git-install vim-install zsh-install

git-install:
	ln -sfn ${DOTFILES}/.gitconfig $HOME/.gitconfig
	ln -sfn ${DOTFILES}/.gitignore $HOME/.gitignore

git-remove:
	-@rm -f $HOME/.gitconfig
	-@rm -f $HOME/.gitignore

vim-install:
	git submodule update --init
	ln -sfn ${DOTFILES}/.vim $HOME/.vim
	ln -sfn ${DOTFILES}/.vimrc $HOME/.vimrc

vim-remove:
	-@rm -f $HOME/.vim
	-@rm -f $HOME/.vimrc

zsh-install:
	ln -sfn ${DOTFILES}/.zsh $HOME/.zsh
	ln -sfn ${DOTFILES}/.zshrc $HOME/.zshrc

zsh-remove:
	-@rm -f $HOME/.zsh
	-@rm -f $HOME/.zshrc

.PHONY: all clean
