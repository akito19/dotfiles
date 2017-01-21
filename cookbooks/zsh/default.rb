package 'zsh'

zplug_home = "#{ENV['HOME']}/.zplug"
git "#{zplug_home}" do
  repository "https://github.com/zplug/zplug"
  not_if "test -d #{zplug_home}"
end

if node[:platform] == 'darwin'
  execute 'change login-shell to Zsh' do
    command 'chsh -s /bin/zsh'
    not_if 'echo $SHELL | grep zsh'
  end
end

ln '.zshrc'

execute 'exec zsh' do
  command 'exec zsh'
  not_if 'echo $SHELL | grep zsh'
end
