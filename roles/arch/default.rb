include_cookbook 'symboliclinks'
include_cookbook 'git'
include_cookbook 'vim'

if ask 'install Ruby'
  include_cookbook 'ruby'
end

if ask 'install Golang'
  include_cookbook 'golang'
end

if ask 'install Python'
  include_cookbook 'python'
end

if ask 'install Rust'
  include_cookbook 'rust'
end

ln '.bash_profile'
ln '.xprofile'

include_cookbook 'tmux'
include_cookbook 'zsh'
