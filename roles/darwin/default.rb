include_cookbook 'base_darwin'
include_cookbook 'symboliclinks'
ln '.bash_profile'

include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'zsh'
include_cookbook 'ruby'
include_cookbook 'golang'

ln '.vimperatorrc'
ln 'bin'
