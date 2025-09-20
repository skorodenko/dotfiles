ZSH_THEME="refined"

# Set ZSH for generic
if [[ -d "$HOME/.oh-my-zsh" ]]; then
    export ZSH=$HOME/.oh-my-zsh
fi

# Set ZSH for archlinux
if [[ -d "/usr/share/oh-my-zsh/" ]]; then
    export ZSH=/usr/share/oh-my-zsh
fi

# Set .local/bin for local installs
export PATH="$PATH:$HOME/.local/bin"

# Set alias for nvim
if [[ $(command -v nvim) ]]; then
    alias vim="nvim"
fi

alias dbox="distrobox"
alias docker="sudo docker"

plugins=(
  cp
  git
  sudo
  tmux
  docker
  vscode
  poetry
  history
  zoxide
  colorize
  archlinux
)

autoload -U compinit
compinit

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
if [[ $(command -v exa) ]]; then
    alias l="exa --long --group"
    alias la="exa --long --all --group"
    alias ls="exa"
fi


# poetry
if [[ $(command -v poetry) ]]; then
    export POETRY_VIRTUALENVS_IN_PROJECT=true
fi


# pipx completions
if [[ $(command -v pipx) ]]; then
    eval "$(register-python-argcomplete pipx)"
fi


# pyenv
if [[ $(command -v pyenv) ]]; then
    export PYENV_ROOT="$HOME/.pyenv"
    [[ -d $PYENV_ROOT/bin ]] && export PATH="$PYENV_ROOT/bin:$PATH"
    eval "$(pyenv init -)"
fi


# zoxide
if [[ $(command -v zoxide) ]]; then
    eval "$(zoxide init zsh)"
fi


# zsh syntax highlightling
if [[ -f "/usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source /usr/share/zsh/plugins/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
elif [[ -f "/usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" ]]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
fi


# tmux integration
if [ $(command -v tmux) ] && [ -z "$TMUX" ] && [ "$TERM" = "xterm-kitty" ]; then
    cur_time=$(date +%s)
    exec tmux new-session -s $cur_time && exit $? && tmux kill-session -t $cur_time;
fi

# fastfetch
if [[ $(command -v fastfetch) ]]; then 
    fastfetch
elif [[ $(command -v neofetch) ]]; then
    neofetch
fi
