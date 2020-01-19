export ZSH="/home/asterix/.oh-my-zsh"
export PATH=/usr/bin:/bin:/usr/local/bin:${PATH}
logpath() { pwd > /tmp/whereami }


#source $ZSH/.zsh_themes
ZSH_THEME="refined"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.config/zsh_functions
source $ZSH/oh-my-zsh.sh

export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=99999
export HISTSIZE=999
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTIGNORE="ls:exit:history:[bf]g:jobs"
unsetopt share_history
unsetopt inc_append_history


alias python="python3.8"
precmd_functions+=logpath
