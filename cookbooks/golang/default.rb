path = "/usr/local"
go_arm64 = "go1.19.darwin-arm64.tar.gz"
go_amd64 = "go1.19.linux_amd64.tar.gz"

directory "/usr/local/go" do
  action :create
  not_if "test -d /usr/local/go"
end

case node[:platform]
when 'darwin'
  package 'gh'
  # TODO: Consider fixsing idea because Apple doesn't allow to create directory to /usr/local without sudo
  # execute "Download Go" do
  #   run_command "curl -sO https://go.dev/dl/#{go_arm64} | tar -xzf #{go_arm64} -C #{path}"
  # end
when 'ubuntu'
  execute "Download Go" do
    run_command "curl -sO https://go.dev/dl/#{go_amd64} | tar -xzf #{go_amd64} -C #{path}"
  end
when 'arch'
  package 'go'
end

# Make directory for golang
directory "#{ENV['HOME']}/src/github.com/akito19" do
  action :create
  not_if "test -d #{ENV['HOME']}/src/github.com/akito19"
end

# Install and make directory for ghq
execute "go install ghq" do
  command "go install github.com/x-motemen/ghq@latest"
end

if node[:platform] == 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
else
  package 'peco'
end
ln '.peco'
