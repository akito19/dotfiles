define :vim, options: '--with-lua --with-luajit' do
  package 'vim' do
    options params[:options]
  end
end

if node[:platform] == 'darwin'
  package 'neovim/neovim/neovim'
  package 'global'
end

ln '.vim'
ln '.vimrc'

# http://qiita.com/okamos/items/2259d5c770d51b88d75b
directory "#{ENV['HOME']}/.config/nvim" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/nvim"
end

link "#{ENV['HOME']}/.config/nvim" do
  to "#{ENV['HOME']}/.vim"
  force true
end

# https://neovim.io/doc/user/filetype.html
directory "#{ENV['HOME']}/.config/nvim/after" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/nvim/after"
end

link "#{ENV['HOME']}/.config/nvim/after/ftplugin" do
  to "#{ENV['HOME']}/.vim/after/ftplugin"
  force true
end

link "#{ENV['HOME']}/.config/nvim/colors" do
  to "#{ENV['HOME']}/.vim/colors"
  force true
end

link "#{ENV['HOME']}/.config/nvim/plugins" do
  to "#{ENV['HOME']}/.vim/plugins"
  force true
end

link "#{ENV['HOME']}/.config/nvim/init.vim" do
  to "#{ENV['HOME']}/.vimrc"
  force true
end
