# ~/.zshrc

export ZSH="$HOME/.oh-my-zsh"
cat ~/.cache/wal/sequences
export PATH=/usr/bin:/bin:/usr/local/bin:~/go/bin:${PATH}

#source $ZSH/.zsh_themes
ZSH_THEME="refined"

plugins=(
  git
  tmux
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

export LESSOPEN="| /usr/bin/src-hilite-lesspipe.sh %s"
export LESS=' -R '
export EDITOR="vim"
export FZF_DEFAULT_COMMAND='fd --type f --hidden --follow --exclude .git'

# Alias
alias python="python3.8"
alias note="vim $HOME/note.md"
# Disable zsh correction for following commands
alias git="nocorrect git"
alias log="nocorrect log"

autoload -Uz add-zsh-hook

function xterm_title_precmd () {
	print -Pn -- '\e]2;%n@%m %~\a'
	[[ "$TERM" == 'screen'* ]] && print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-}\e\\'
}

function xterm_title_preexec () {
	print -Pn -- '\e]2;%n@%m %~ %# ' && print -n -- "${(q)1}\a"
	[[ "$TERM" == 'screen'* ]] && { print -Pn -- '\e_\005{g}%n\005{-}@\005{m}%m\005{-} \005{B}%~\005{-} %# ' && print -n -- "${(q)1}\e\\"; }
}

if [[ "$TERM" == (alacritty*|gnome*|konsole*|putty*|rxvt*|screen*|tmux*|xterm*) ]]; then
	add-zsh-hook -Uz precmd xterm_title_precmd
	add-zsh-hook -Uz preexec xterm_title_preexec
fi

# This logs the current path for opening a new terminal in same path
logpath() { pwd > /tmp/whereami }
precmd_functions+=logpath

xmodmap $HOME/.Xmodmap 2>/dev/null

