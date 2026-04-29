if [ -d "$HOME/.local/bin" ] && [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
  export PATH="$HOME/.local/bin:$PATH"
fi

if [ -d /snap/bin ] && [[ ":$PATH:" != *":/snap/bin:"* ]]; then
  export PATH="/snap/bin:$PATH"
fi

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
source /usr/share/zsh-autosuggestions/zsh-autosuggestions.zsh

export EDITOR='pico'
export VISUAL='code'

alias bat="batcat"
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
source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

if [ -f "$HOME/.zshrc.local" ]; then
  source "$HOME/.zshrc.local"
fi
