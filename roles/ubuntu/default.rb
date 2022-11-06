include_cookbook 'symboliclinks'
include_cookbook 'git'
include_cookbook 'zsh'

directory "#{ENV['HOME']}/src/github.com" do
  action :create
  user ENV['USER']
  # not_if "test -d #{ENV['HOME']}/src/github.com"
end

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

include_cookbook 'vim'
ln '.bash_profile'
