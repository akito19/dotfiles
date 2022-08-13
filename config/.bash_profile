export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GIT_EDITOR=vim

[[ -f ~/.bashrc ]] && . ~/.bashrc
. "$HOME/.cargo/env"
