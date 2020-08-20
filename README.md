# Installation
1. Initialize bare git repository in the to-be dotfile dir:
    `git init --bare $HOME/.dotfiles`
2. Create an alias for working with your dotfiles:
    `alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'`
3. Hide untracked files per default:
    `dotfiles config --local status.showUntrackedFiles no`
4. Export the alias to your shell profile, for me .zshrc:
    `echo "alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.zshrc`
5. Clone this repository into your dotfiles:
    `git clone --bare https://github.com/thraizz/dotfiles.git $HOME/.dotfiles`
6. Checkout the actual dotfiles content:
    `dotfiles checkout`
7. Run the init script under scripts/init.sh:
    `bash -c $HOME/scripts/init.sh`

