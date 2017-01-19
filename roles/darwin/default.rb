if ask('set up Xcode and Homebrew')
  include_cookbook 'base_darwin'
end

include_cookbook 'symboliclinks'
include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'zsh'
include_cookbook 'tmux'

if ask('install ruby')
  include_cookbook 'ruby'
end

if ask('install golang')
  include_cookbook 'golang'
end

ln '.bash_profile'
ln '.vimperatorrc'
ln 'bin'
