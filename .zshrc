export ZSH="/home/asterix/.oh-my-zsh"
export PATH=/bin:/usr/bin:/usr/local/bin:${PATH}

ZSH_THEME="robbyrussell"
ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

plugins=(
  base16-shell
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
)

source $HOME/.config/zsh_functions
source $ZSH/oh-my-zsh.sh
source $BASE16_SHELL/base16-monokai.sh

export HISTCONTROL=ignoredups:ignorespace
export HISTFILESIZE=99999
export HISTSIZE=999
export HISTTIMEFORMAT='%Y-%m-%d %H:%M.%S | '
export HISTIGNORE="ls:exit:history:[bf]g:jobs"
