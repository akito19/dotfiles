package 'vim'

ln '.vim'
ln '.vimrc'

# TODO: NeoVimのインストールもできるようにする
directory "#{ENV['HOME']}/.config/nvim" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/nvim"
end

# http://qiita.com/okamos/items/2259d5c770d51b88d75b
execute "symlink .vim dir to nvim dir" do
  command "ln -snfv #{ENV['HOME']}/.vim #{ENV['HOME']}/.config/nvim/"
end

execute "symlink .vimrc to init.vim" do
  command "ln -snfv #{ENV['HOME']}/.vimrc #{ENV['HOME']}/.config/nvim/init.vim"
end
