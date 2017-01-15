export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/git/bin"

# configuration umask
# umask 002

plugins=(git ruby gem osx bundler brew rails)

#
# Plugins -zplug-
#

export ZPLUG_HOME=${HOME}/.zplug
source ${ZPLUG_HOME}/init.zsh

# write "user_name/repository"
zplug "zsh-users/zsh-syntax-highlighting"
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-completions"

# install
if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo; zplug install
    fi
fi

# プラグインを読み込み、コマンドにパスを通す
zplug load --verbose

#
# Prompt
#

setopt prompt_subst
autoload -Uz colors
colors
PROMPT="%{$fg[green]%}%n@%m:%{$fg_bold[blue]%}%2~%{$reset_color%} %# "

#
# http://mollifier.hatenablog.com/entry/20100906/p1
# git prompt
#

autoload -Uz add-zsh-hook
autoload -Uz vcs_info

zstyle ':vcs_info:*' enable git svn hg bzr
zstyle ':vcs_info:*' formats '(%s)-[%b]'
zstyle ':vcs_info:*' actionformats '(%s)-[%b|%a]'
zstyle ':vcs_info:(svn|bzr):*' branchformat '%b:r%r'
zstyle ':vcs_info:bzr:*' use-simple true

zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' stagedstr "+"    # 適当な文字列に変更する
zstyle ':vcs_info:git:*' unstagedstr "-"  # 適当な文字列に変更する
zstyle ':vcs_info:git:*' formats '(%s)-[%b] %c%u'
zstyle ':vcs_info:git:*' actionformats '(%s)-[%b|%a] %c%u'


function _update_vcs_info_msg() {
    psvar=()
    LANG=en_US.UTF-8 vcs_info
    [[ -n "$vcs_info_msg_0_" ]] && psvar[1]="$vcs_info_msg_0_"
}
add-zsh-hook precmd _update_vcs_info_msg
RPROMPT="%1(v|%F{green}%1v%f|)"

#
# General Configuration
#

setopt no_beep
setopt correct

setopt auto_list
setopt auto_menu

export GIT_EDITOR=vim
export GIT_MERGE_AUTOEDIT=no
export HOMEBEW_CASK_OPTS="--appdir=/Applications"

export HISTFILE=${HOME}/.zsh_history
export HISTSIZE=1000
export SAVEHIST=100000
setopt hist_ignore_dups
setopt EXTENDED_HISTORY
typeset -U path PATH

#
# Languages
#

# rbenv
export RBENV_ROOT="$HOME/.rbenv"
export PATH="$RBENV_ROOT/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

# golang
export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin

DOTFILE_ROOT=$HOME/dotfiles/config
if [ -d $DOTFILE_ROOT/zsh.d ]; then
  for file in $DOTFILE_ROOT/zsh.d/*; do
    source $file
  done
fi

case "${OSTYPE}" in
# MacOSX
  darwin*)
    [ -f $DOTFILE_ROOT/zshrc.d/zshrc.darwin ] && source $DOTFILE_ROOT/zshrc.d/zshrc.darwin
    ;;
# Linux
  linux*)
    [ -f $DOTFILE_ROOT/zshrc.d/zshrc.linux ] && source $DOTFILE_ROOT/zshrc.d/zshrc.linux
    ;;
esac
