package 'go'
package 'peco'

# make directory for golang
directory "#{ENV['HOME']}/go/src/github.com/akito19" do
  action :create
  not_if "test -d #{ENV['HOME']}/go/src/github.com/akito19"
end

# install and make directory for ghq
execute "go get ghq" do
  command "go get github.com/motemen/ghq"
  not_if "test -d #{ENV['HOME']}/go/src/github.com/motemen/ghq"
end

directory "#{ENV['HOME']}/ghq/github.com/akito19" do
  action :create
  not_if "test -d #{ENV['HOME']}/ghq/github.com/akito19"
end

ln 'peco'
