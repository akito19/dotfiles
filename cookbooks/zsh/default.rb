package 'zsh'

# If you face permission denied, try:
# $ chown -R $USER ~/.zplug
zplug_home = "#{ENV['HOME']}/.zplug"
git "#{zplug_home}" do
  repository "https://github.com/zplug/zplug"
  not_if "test -d #{zplug_home}"
end

execute 'change login-shell to Zsh' do
  command 'chsh -s $(which zsh)'
  not_if 'echo $SHELL | grep zsh'
end

ln '.zshrc'
