package 'zsh'

zplug_home = "#{ENV['HOME']}/.zplug"
git "#{zplug_home}" do
  repository "https://github.com/zplug/zplug"
  not_if "test -d #{zplug_home}"
end

ln '.zshrc'
