package 'zsh'

execute 'change login-shell to Zsh' do
  command 'chsh -s $(which zsh)'
  not_if 'echo $SHELL | grep zsh'
end

ln '.zshrc'
