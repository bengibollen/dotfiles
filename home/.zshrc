if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d /snap/bin ] && [[ ":$PATH:" != *":/snap/bin:"* ]]; then
  export PATH="/snap/bin:$PATH"
fi

export PAGER='less'
export MANPAGER="less -R"
export MANROFFOPT='-P -c'
export LESS="-iMR"

# Less colors
export LESS_TERMCAP_md=$'\e[01;38;5;74m'
export LESS_TERMCAP_me=$'\e[0m'
export LESS_TERMCAP_se=$'\e[0m'
export LESS_TERMCAP_so=$'\e[38;5;246m'
export LESS_TERMCAP_us=$'\e[04;38;5;146m'
export LESS_TERMCAP_ue=$'\e[0m'



export ZSH="$HOME/.oh-my-zsh"
ZSH_THEME=""

DISABLE_UNTRACKED_FILES_DIRTY="true"
HIST_STAMPS="yyyy-mm-dd"

plugins=(git fzf)
DISABLE_FZF_AUTO_COMPLETION="true"

source "$ZSH/oh-my-zsh.sh"

zmodload zsh/complist
zstyle ':completion:*' menu select
zstyle ':completion:*' group-name ''
zstyle ':completion:*:descriptions' format '%F{yellow}%d%f'
zstyle ':completion:*' list-colors "${(s.:.)LS_COLORS}"
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'
zstyle ':completion:*:*:(kill|pkill|killall):*' menu yes select

ZSH_AUTOSUGGEST_USE_ASYNC=true

  export EDITOR='nano'
if [[ "$(uname -s)" == "Darwin" ]]; then
  export PATH="/Applications/Visual Studio Code.app/Contents/Resources/app/bin:$PATH"
  export VISUAL="$HOME/bin/code-wait"
else
  export VISUAL='code'
fi

if [[ "$(uname -s)" == "Linux" ]] && command -v batcat >/dev/null 2>&1; then
  alias bat="batcat"
fi
  alias ls="eza --group-directories-first --icons"
  alias l="eza -lah --group-directories-first --git"
  alias la="eza -lAh --group-directories-first --git"
  alias ll="eza -lh --group-directories-first --git"
  alias tree="eza --tree --group-directories-first"

dotpush() {
  local repo="$HOME/dotfiles"
  local message="${*:-Update dotfiles}"

  git -C "$repo" add -A &&
    git -C "$repo" commit -m "$message" &&
    git -C "$repo" push
}

  eval "$(starship init zsh)"

# Keep syntax highlighting last so it can wrap the final widgets cleanly.
  if [ -f /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh ]; then
    source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh
  elif command -v brew >/dev/null 2>&1; then
    source "$(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh"
  fi

  if [ -f /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh ]; then
    source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
  elif command -v brew >/dev/null 2>&1; then
    source "$(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh"
  fi
if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
# XDG base directories
: "${XDG_CONFIG_HOME:=$HOME/.config}"
: "${XDG_DATA_HOME:=$HOME/.local/share}"
: "${XDG_STATE_HOME:=$HOME/.local/state}"
: "${XDG_CACHE_HOME:=$HOME/.cache}"

export XDG_CONFIG_HOME
export XDG_DATA_HOME
export XDG_STATE_HOME
export XDG_CACHE_HOME
