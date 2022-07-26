rbenv_root = "#{ENV['HOME']}/.rbenv"
git "#{rbenv_root}" do
  repository "https://github.com/rbenv/rbenv.git"
  not_if "test -d #{rbenv_root}"
end

execute "make rbenv" do
  command "cd #{rbenv_root} && src/configure && make -C src "
end

directory  "#{rbenv_root}/plugins" do
  action :create
  not_if "test -d #{rbenv_root}/plugins"
end

plugin_dir = "#{rbenv_root}/plugins/ruby-build"
git "#{plugin_dir}" do
  repository "https://github.com/rbenv/ruby-build.git"
end

execute "rbenv doctor" do
  command "curl -fsSL https://github.com/rbenv/rbenv-installer/raw/main/bin/rbenv-doctor | bash"
end

execute "bundler settings" do
  command "bundle config set path 'vendor/bundle'"
end
