include_cookbook 'symboliclinks'
include_cookbook 'tools'
include_cookbook 'git'
include_cookbook 'zsh'

directory "#{ENV['HOME']}/src/github.com" do
  action :create
  user ENV['USER']
  # not_if "test -d #{ENV['HOME']}/src/github.com"
end

include_cookbook 'vim'

ln '.bash_profile'
package 'xclip'
