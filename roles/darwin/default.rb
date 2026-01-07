include_cookbook 'symboliclinks'
include_cookbook 'tools'
include_cookbook 'git'
include_cookbook 'vim'
include_cookbook 'ghostty'

directory "#{ENV['HOME']}/src/github.com" do
  action :create
  not_if "test -d #{ENV['HOME']}/src/github.com"
end

ln '.bash_profile'
ln '.ctags'
ln '.latexmkrc'

include_cookbook 'zsh'
