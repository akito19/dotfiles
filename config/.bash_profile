export PATH="$HOME/.rbenv/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
if which rbenv > /dev/null; then eval "$(rbenv init -)"; fi

### bash_completion
if [ -f $(brew --prefix)/etc/bash_completion ]; then
  . $(brew --prefix)/etc/bash_completion
fi


GIT_PS1_SHOWDIRTYSTATE=TRUE
export PS1='\[\033[32m\]\u@\h\[\033[00m\]:\[\033[34m\]\w\[\033[31m\]$(__git_ps1)\[\033[00m\]\$ '


export DATABASEDOTCOM_VERIFY_MODE=OpenSSL::SSL::VERIFY_NONE
export JAVA_HOME="$(/usr/libexec/java_home)"
export AWS_ACCESS_KEY="ãããããã¼"
export AWS_SECRET_KEY="ãã¼ããã£ã¨ãã¼"
export EC2_HOME="/usr/local/Cellar/ec2-api-tools/1.6.13.0/libexec"
export EC2_URL=https://ec2.ap-northeast-1.amazonaws.com
export EC2_REGION=ap-northeast-1
export HOMEBEW_CASK_OPTS="--appdir=/Applications"

# vim
export PATH=/usr/local/bin:/usr/bin

# postgresql 設定
export PGDATA=/usr/local/var/postgres

export GIT_EDITOR=vim

# added by Anaconda 2.3.0 installer
export PATH="/Users/akito/anaconda/bin:$PATH"
if which pyenv > /dev/null; then eval "$(pyenv init -)"; fi

# added by Anaconda3 2.3.0 installer
export PATH="//anaconda/bin:$PATH"

# added by Anaconda3 2.3.0 installer
export PATH="//anaconda/bin:$PATH"
