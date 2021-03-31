#!/bin/bash

# Install wanted packages
sudo pacman -Syu --needed $(cat $HOME/installed_packages.txt | xargs)

# Install oh-my-zsh and plugins if not present already
if [[ -z $HOME/.oh-my-zsh ]]; then
	sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
	# Proceed only if script suceeded
	if $?; then
		# Restore my zshrc
		mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
		git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions	
		git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
	fi
fi

# Install AURs
for file in $(ls $HOME/aur); do
    cd $HOME/aur/$file
    git checkout master
    git pull origin master
    # Keep sudo alive
    sudo ls
    # Only install not-installed packages
    makepkg -sif --noconfirm --needed
done

# Install neovim plugin manager vim-plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'


# Install cht.sh
mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

# Get dual monitors, if present
echo "*.monitor1: $(xrandr --query | grep -P ' connected primary' | cut -d' ' -f1)" >> .Xresources
echo "*.monitor2: $(xrandr --query | grep -P ' connected 1' | cut -d' ' -f1)" >> .Xresources
