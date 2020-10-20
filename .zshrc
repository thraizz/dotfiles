# ~/.zshrc
export TERM="xterm-256color"
export ZSH="$HOME/.oh-my-zsh"
export PATH=/usr/bin:/bin:/usr/local/bin:~/go/bin:${PATH}

ZSH_THEME="refined"

plugins=(
  git
  tmux
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.config/zsh_functions
source $ZSH/oh-my-zsh.sh
source $HOME/.token

#ENABLE_CORRECTION="true"
DISALE_CORRECTION="true"
ZSH_TMUX_AUTOSTART=true
export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=999999
export HISTSIZE=99999
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTIGNORE="ls:exit:history:[bf]g:jobs"
unsetopt share_history
setopt inc_append_history
unsetopt correct_all

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Alias
source $HOME/.config/aliases

xmodmap $HOME/.Xmodmap 2>/dev/null

autoload -Uz compinit
compinit
# Completion for kitty
kitty + complete setup zsh | source /dev/stdin
