# ~/.zshrc
export TERM="xterm-kitty"
export ZSH="$HOME/.oh-my-zsh"
export LANG=en_US.utf8
export PATH=$HOME/scripts:/usr/bin:/bin:$HOME/.local/bin:$HOME/bin:/usr/local/bin:~/go/bin:./node_modules/.bin:${PATH}
#
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
export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
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
