#!/bin/bash

# Install wanted packages
sudo pacman -Syu $(cat $HOME/installed_packages.txt | xargs)

# Install oh-my-zsh and plugins
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"
# Restore my zshrc
mv $HOME/.zshrc.pre-oh-my-zsh $HOME/.zshrc
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting

# Install neovim plugin manager vim-plugin
sh -c 'curl -fLo "${XDG_DATA_HOME:-$HOME/.local/share}"/nvim/site/autoload/plug.vim --create-dirs \
       https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'

# Install AURs
for file in $(ls $HOME/aur); do
    cd $HOME/$file
    makepkg -sif --noconfirm
done

# Install cht.sh
mkdir -p ~/bin/
curl https://cht.sh/:cht.sh > ~/bin/cht.sh
chmod +x ~/bin/cht.sh

# Get dual monitors, if present
echo "*.monitor1: $(xrandr --listmonitors | grep -G '0:' | grep -Po '(?<= .)[a-zA-Z0-9]*$')" >> .Xresources
echo "*.monitor2: $(xrandr --listmonitors | grep -G '1:' | grep -Po '(?<= .)[a-zA-Z0-9]*$')" >> .Xresources
