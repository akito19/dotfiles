export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export GIT_EDITOR=vim

export PATH="$HOME/.cargo/bin:$PATH"
[[ -f ~/.bashrc ]] && . ~/.bashrc
