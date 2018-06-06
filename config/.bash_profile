export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.13.0/libexec"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
export EC2_REGION=ap-northeast-1

export GIT_EDITOR=vim

export PATH="$HOME/.cargo/bin:$PATH"
[[ -f ~/.bashrc ]] && . ~/.bashrc
