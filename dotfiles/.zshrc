if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

autoload -Uz compinit
compinit

setopt HIST_IGNORE_DUPS
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_VERIFY
setopt INC_APPEND_HISTORY
setopt EXTENDED_HISTORY

export HISTFILE="$HOME/.zsh_history"
export HISTSIZE=9999999
export SAVEHIST=$HISTSIZE
SAVEHIST=$((HISTSIZE/2))
HISTORY_IGNORE="rm *|ls|fg"

bindkey -v
bindkey '^[[Z' reverse-menu-complete

setopt MENU_COMPLETE
setopt NO_LIST_BEEP
setopt NO_BEEP

PS1='
[%Th] %F{green}%n@%m%f %F{yellow}%~%f%F{blue}$(__git_ps1)%f
$ '

export FZF_DEFAULT_OPTS='--height 40% --layout=reverse --border
--bind=ctrl-alt-f:page-down,ctrl-alt-b:page-up,ctrl-alt-n:preview-page-down,ctrl-alt-p:preview-page-up'


### Added by Zinit's installer
if [[ ! -f $HOME/.zinit/bin/zinit.zsh ]]; then
    print -P "%F{33}▓▒░ %F{220}Installing %F{33}DHARMA%F{220} Initiative Plugin Manager (%F{33}zdharma/zinit%F{220})…%f"
    command mkdir -p "$HOME/.zinit" && command chmod g-rwX "$HOME/.zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.zinit/bin" && \
        print -P "%F{33}▓▒░ %F{34}Installation successful.%f%b" || \
        print -P "%F{160}▓▒░ The clone has failed.%f%b"
fi

source "$HOME/.zinit/bin/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-rust \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-bin-gem-node

### End of Zinit's installer chunk

zinit ice depth=1
zinit light romkatv/powerlevel10k

zinit ice depth=1
zinit light jeffreytse/zsh-vi-mode

# Copied from https://zdharma.org/zinit/wiki/Example-Minimal-Setup/
zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions \
  blockf atpull'zinit creinstall -q .' \
      zsh-users/zsh-completions

zinit ice lucid wait'0'
zinit light joshskidmore/zsh-fzf-history-search

zinit load jeffreytse/zsh-vi-mode

export TERM=xterm-256color
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=60'


# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Remove the forward slash and hyphen characters from what is considered part
# of a word so meta+f and meta+b will stop at directory boundaries.
WORDCHARS=${WORDCHARS//[\/-]}

# Case-insensitve completion. Copied from
# https://stackoverflow.com/a/24237590/5821101.
zstyle ':completion:*' matcher-list '' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Aliases
alias vim="nvim"
alias vi="nvim"

export PATH=$PATH:/Applications/Alacritty.app/Contents/MacOS/

export EDITOR="$(which nvim)"
autoload edit-command-line; zle -N edit-command-line
bindkey -M vicmd ' ' edit-command-line

eval "$(fzf --zsh)"

source ~/klementtan-home/dotfiles/zsh/fzf-zsh-completion.sh
bindkey '^I' fzf_completion
