include_cookbook 'symboliclinks'
include_cookbook 'vim'
include_cookbook 'git'
include_cookbook 'zsh'
include_cookbook 'ruby'

ln '.vimperatorrc'
ln '.tmux.conf'
ln '.bash_profile'
ln 'bin'
# TODO: peco を自動インストールするようにしてから
# ln 'peco'
