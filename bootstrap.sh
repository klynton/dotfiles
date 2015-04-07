#!/bin/bash
cd "$(dirname "${BASH_SOURCE}")"

cp $HOME/.bash_profile $HOME/.bash_profile.bak
cp $HOME/.bashrc $HOME/.bashrc.bak
cp $HOME/.gitconfig $HOME/.gitconfig.bak
cp $HOME/.tmux.conf $HOME/.tmux.conf.bak
cp $HOME/.vimrc $HOME/.vimrc.bak

echo "Your original .bash_profile has been backed up to .bash_profile.bak"
echo "Your original .bashrc has been backed up to .bashrc.bak"
echo "Your original .gitconfig has been backed up to .gitconfig.bak"

echo "Pulling down the latest VIM modules."
/usr/bin/ruby ~/.vim/update_bundles

git pull
function doIt() {
	rsync --exclude ".git/" --exclude ".DS_Store" --exclude "bootstrap.sh" --exclude "README.md" -av . ~
}
if [ "$1" == "--force" -o "$1" == "-f" ]; then
	doIt
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		doIt
	fi
fi
unset doIt
source ~/.bash_profile
