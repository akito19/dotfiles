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
# Aliases
#

# general aliases
alias g='git'
alias la='ls -a -G' ll='ls -la -G'
alias zshconfig="mate ~/dotfiles/config/.zshrc"
alias grep="grep --color"
alias relogin='exec $SHELL -l'
alias -s html='pick-web-browser'
alias web='pick-web-browser'

# rails aliases
alias ralis='rails'
alias rials='rails'
alias be='bundle exec'
alias bi='bundle install'

ZSH_SRC='dotfiles/config/zshrc'
# zstyle読み込み
if [ -f ${HOME}/${ZSH_SRC}/zstyle ]; then
  source ${HOME}/${ZSH_SRC}/zstyle
fi

case "${OSTYPE}" in
# MacOSX
  darwin*)
    [ -f ${HOME}/${ZSH_SRC}/darwin ] && source ${HOME}/${ZSH_SRC}/darwin
    ;;
# Linux
  linux*)
    [ -f ${HOME}/${ZSH_SRC}/linux ] && source ${HOME}/${ZSH_SRC}/linux
    ;;
esac
