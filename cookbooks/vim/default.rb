package 'vim'

ln '.vim'
ln '.vimrc'

# TODO: NeoVimのインストールもできるようにする
directory "#{ENV['HOME']}/.config/nvim" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/nvim"
end

# http://qiita.com/okamos/items/2259d5c770d51b88d75b
link "#{ENV['HOME']}/.vim" do
  to "#{ENV['HOME']}/.config/nvim"
  force true
end

link "#{ENV['HOME']}/.vimrc" do
  to "#{ENV['HOME']}/.config/nvim/init.vim"
  force true
end
