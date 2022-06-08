# ~/.zshrc
export TERM="xterm-kitty"
export NNN_FIFO=/tmp/nnn.fifo
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.utf8
export DISABLE_AUTO_TITLE=true
export PATH=$HOME/scripts:$HOME/.local/bin:$HOME/bin:/usr/local/bin:~/go/bin:./node_modules/.bin:/usr/bin:/bin:${PATH}
##ENABLE_CORRECTION="true"
DISALE_CORRECTION="true"
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
export EDITOR="nvim"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Android Studio stuff
export ANDROID_SDK_ROOT=$HOME/Android/Sdk
# export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
# export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
# export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
export STUDIO_PATH="/opt/android-studio/bin/studio.sh"
export JAVA_HOME="/usr/lib/jvm/java-11-openjdk"

# NVM stuff
export NVM_NO_USE=true
export NVM_LAZY_LOAD=true
export NVM_AUTO_USE=true


ZSH_THEME="refined"

plugins=(
  git
  zsh-autosuggestions
  zsh-syntax-highlighting
  zsh-nvm
)

source $HOME/.config/zsh_functions
source $ZSH/oh-my-zsh.sh
source $HOME/.token
source $HOME/.config/aliases

[ -n "$NNNLVL" ] && PS1="N$NNNLVL $PS1"

if which ruby >/dev/null && which gem >/dev/null; then
    PATH="$(ruby -r rubygems -e 'puts Gem.user_dir')/bin:$PATH"
fi

typeset -U path
