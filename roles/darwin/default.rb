include_cookbook 'symboliclinks'
include_cookbook 'git'
include_cookbook 'vim'

if ask 'install Ruby'
  include_cookbook 'ruby'
end

if ask 'install Golang'
  include_cookbook 'golang'
end

ln 'bash_profile'

include_cookbook 'tmux'
include_cookbook 'zsh'
