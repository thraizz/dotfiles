#
# ~/.zshrc
#

export ZSH="$HOME/.oh-my-zsh"
cat ~/.cache/wal/sequences
export PATH=/usr/bin:/bin:/usr/local/bin:${PATH}

#source $ZSH/.zsh_themes
ZSH_THEME="refined"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.config/zsh_functions
source $ZSH/oh-my-zsh.sh

#ENABLE_CORRECTION="true"
DISALE_CORRECTION="true"
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=999999
export HISTSIZE=99999
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTIGNORE="ls:exit:history:[bf]g:jobs"
unsetopt share_history
setopt inc_append_history
unsetopt correct_all


export EDITOR="vim"

# Alias
alias python="python3.8"
alias note="vim $HOME/note.md"
# Disable zsh correction for following commands
alias git="nocorrect git"
alias log="nocorrect log"

# This logs the current path for opening a new terminal in same path
logpath() { pwd > /tmp/whereami }
recmd_functions+=logpath

