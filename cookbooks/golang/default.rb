case node[:platform]
when 'darwin'
  package 'go'
when 'ubuntu'
  # https://golang.org/dl/
when 'arch'
  package 'go'
end

# Make directory for golang
directory "#{ENV['HOME']}/go/src/github.com/akito19" do
  action :create
  not_if "test -d #{ENV['HOME']}/go/src/github.com/akito19"
end

# Install and make directory for ghq
execute "go get ghq" do
  command "go get github.com/motemen/ghq"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/motemen/ghq"
end

directory "#{ENV['HOME']}/ghq/github.com/akito19" do
  action :create
  not_if "test -d #{ENV['HOME']}/ghq/github.com/akito19"
end

execute "go get hub" do
  command "go get github.com/github/hub"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/github/hub"
end

execute "go get ptmux" do
  command "go get github.com/pocke/ptmux"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/pocke/ptmux"
end

execute "go get get" do
  command "go get github.com/pocke/get"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/pocke/get"
end

directory "#{ENV['HOME']}/.config/ptmux" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/ptmux"
end

if node[:platform] == 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
else
  package 'peco'
end
ln '.peco'
