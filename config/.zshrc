export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

# Terminal Language
export LANG=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8

# Set OSTYPE as ENV
# The option below is used for tmux mainly.
export OSTYPE=$OSTYPE
export XDG_CONFIG_HOME=$HOME/.config

# configuration umask
umask 022

#
# Plugins zinit
#

ZINIT_HOME="${XDG_DATA_HOME:-${HOME}/.local/share}/zinit/zinit.git"
if [[ ! -d $ZINIT_HOME ]]; then
  mkdir -p "$(dirname $ZINIT_HOME)"
  git clone https://github.com/zdharma-continuum/zinit.git "$ZINIT_HOME"
fi

source "${ZINIT_HOME}/zinit.zsh"


# write "user_name/repository"
zinit light zsh-users/zsh-syntax-highlighting
zinit light zsh-users/zsh-history-substring-search
zinit light zsh-users/zsh-completions
zinit light rkh/zsh-jj

autoload -Uz compinit
compinit

#
# Prompt
#

setopt prompt_subst
autoload -Uz promptinit
promptinit
# prompt theme has been moved to OSTYPE condition block.

#
# http://mollifier.hatenablog.com/entry/20100906/p1
# git prompt
#

autoload -Uz add-zsh-hook vcs_info

zstyle ':vcs_info:*' enable git svn jj
zstyle ':vcs_info:*' formats '[%s:%b]'
zstyle ':vcs_info:*' actionformats '[%s:%b|%a]'

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"
zstyle ':vcs_info:git:*' unstagedstr "-"
zstyle ':vcs_info:git:*' formats '[%s:%b (%c%u)]'
zstyle ':vcs_info:git:*' actionformats '[%s:%b|%a (%c%u)]'

function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    local msg="${vcs_info_msg_0_}"
    msg="${msg// \(\)/}"  # 空の () を除去
    [[ -n "$msg" ]] && psvar[1]="$msg"
}
add-zsh-hook precmd _update_vcs_info_msg

function _update_prompt() {
    local depth=${#${(s:/:)${(%):-%~}}}
    local user_host
    case $OSTYPE in
      linux*)
        user_host='%K{red}%F{white}%n@%m%f%k'
        ;;
      *)
        user_host='%n@%m'
        ;;
    esac

    if (( depth >= 4 )); then
        PROMPT="${user_host}:%F{cyan}%~%f%1(v| %F{yellow}%1v%f|)
 %(!.#.%%) "
    else
        PROMPT="${user_host}:%F{cyan}%~%f%1(v| %F{yellow}%1v%f|) %(!.#.%%) "
    fi
}
add-zsh-hook precmd _update_prompt

#
# General Configuration
#

setopt no_beep
setopt correct

setopt auto_list
setopt auto_menu

export GIT_MERGE_AUTOEDIT=no

export HISTFILE=$HOME/.zsh_history
export HISTSIZE=1000000
export SAVEHIST=1000000
setopt hist_ignore_all_dups
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
typeset -U path PATH

#
# Languages
#

# Ruby
export RBENV_ROOT=$HOME/.rbenv
export PATH=$RBENV_ROOT/bin:$PATH
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# Rust
if [ -d $HOME/.cargo ]; then
  source $HOME/.cargo/env
fi
export RUST_PATH=$HOME/.cargo/bin
export PATH=$HOME/$RUST_PATH:$PATH

# Golang
export GOPATH=$HOME/src
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/go/bin

# Python
export PYENV_ROOT=$HOME/.pyenv
export PATH=$PYENV_ROOT/bin:$PATH
if which pyenv > /dev/null; then eval "$(pyenv init --path)"; fi

# OCaml
test -r $HOME/.opam/opam-init/init.zsh && . $HOME/.opam/opam-init/init.zsh > /dev/null 2> /dev/null || true

# Haskell
export PATH=$HOME/.local/bin:$PATH

# Node.js
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Zsh settings devided by OS
DOTFILE_ROOT=$HOME/dotfiles/config
if [ -d $DOTFILE_ROOT/zsh.d ]; then
  for file in $DOTFILE_ROOT/zsh.d/*; do
    source $file
  done
fi

case $OSTYPE in
  darwin*)
    export CLICOLOR=1
    export LSCOLORS="Gxfxcxdxbxegedabagacad"
    [ -f $DOTFILE_ROOT/zshrc.d/zshrc.darwin ] && source $DOTFILE_ROOT/zshrc.d/zshrc.darwin
    [ -f $DOTFILE_ROOT/zshrc.d/zshrc.td ] && source $DOTFILE_ROOT/zshrc.d/zshrc.td
    ;;
  linux*)
    [ -f $DOTFILE_ROOT/zshrc.d/zshrc.linux ] && source $DOTFILE_ROOT/zshrc.d/zshrc.linux
    ;;
esac
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# bun completions
[ -s "/Users/akito/.bun/_bun" ] && source "/Users/akito/.bun/_bun"

# bun
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"
