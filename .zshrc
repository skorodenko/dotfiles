ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="refined"

export TERM="xterm-256color"
export ZSH=/usr/share/oh-my-zsh
export PATH="$PATH:/home/rinkuro/.local/bin"

alias vim="/home/rinkuro/.local/bin/lvim"
alias dbox="distrobox"
#alias docker="sudo docker"

plugins=(
  git
  archlinux
  docker
  vscode
  colorize
  cp
  sudo
  poetry
  zsh-syntax-highlighting
)

autoload -U bashcompinit
bashcompinit

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

DISABLE_AUTO_UPDATE="true"

ZSH_CACHE_DIR=$HOME/.cache/oh-my-zsh
if [[ ! -d $ZSH_CACHE_DIR ]]; then
  mkdir $ZSH_CACHE_DIR
fi

source $ZSH/oh-my-zsh.sh

#pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# Autocmpletions
eval "$(register-python-argcomplete pipx)"

neofetch
