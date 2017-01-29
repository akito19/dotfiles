if node[:platform] == 'darwin'
  package 'neovim/neovim/neovim'
end

define :vim, options: '--with-lua --with-luajit' do
  package 'vim' do
    options params[:options]
  end
end

ln '.vim'
ln '.vimrc'

directory "#{ENV['HOME']}/.config/nvim" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/nvim"
end

# http://qiita.com/okamos/items/2259d5c770d51b88d75b
link "#{ENV['HOME']}/.config/nvim" do
  to "#{ENV['HOME']}/.vim"
  force true
end

link "#{ENV['HOME']}/.config/nvim/init.vim" do
  to "#{ENV['HOME']}/.vimrc"
  force true
end
