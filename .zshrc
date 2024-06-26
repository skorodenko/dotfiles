ZSH=/usr/share/oh-my-zsh/
ZSH_THEME="refined"

export TERM="xterm-256color"
export ZSH=/usr/share/oh-my-zsh
export PATH="$PATH:/home/rinkuro/.local/bin"

#alias vim="/home/rinkuro/.local/bin/lvim"
alias vim="/usr/bin/nvim"
alias dbox="distrobox"
#alias docker="sudo docker"

plugins=(
  cp
  git
  sudo
  tmux
  docker
  vscode
  poetry
  history
  colorize
  archlinux
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

# Start ssh-agent
if ! pgrep -u "$USER" ssh-agent > /dev/null; then
    ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
fi
if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
    source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
fi


# exa
if [ -x "$(command -v exa)" ]; then
    alias l="exa --long --group"
    alias la="exa --long --all --group"
    alias ls="exa"
fi

# pyenv
export PYENV_ROOT="$HOME/.pyenv"
[[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

# zoxide
eval "$(zoxide init zsh)"

# Autocmpletions
eval "$(register-python-argcomplete pipx)"

fastfetch
