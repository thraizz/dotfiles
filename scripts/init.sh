#!/bin/bash

# Install wanted packages
sudo pacman -Syu $(cat $HOME/installed_packages.txt | xargs)

## Install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Restore my zshrc
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install AURs
for file in $(ls $HOME/aur); do
    cd $HOME/$file
    makepkg -sif --noconfirm
done

# Install cht.sh
mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

