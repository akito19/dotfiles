define :vim, options: '--with-lua --with-luajit' do
  package 'vim' do
    options params[:options]
  end
end

case node[:platform]
when 'darwin'
  package 'neovim/neovim/neovim'
  package 'global'
when 'ubuntu'
  package 'neovim'
when 'arch'
  package 'neovim'
end

# Legacy Vim configuration (kept for backward compatibility)
ln '.vim'
ln '.vimrc'

# Neovim configuration with lazy.nvim
# Remove old symlinks if they exist
execute "rm -rf #{ENV['HOME']}/.config/nvim" do
  only_if "test -L #{ENV['HOME']}/.config/nvim || test -d #{ENV['HOME']}/.config/nvim"
end

# Create ~/.config directory if it doesn't exist
directory "#{ENV['HOME']}/.config" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config"
end

# Link the new nvim configuration
link "#{ENV['HOME']}/.config/nvim" do
  to File.expand_path('../../../config/nvim', __FILE__)
  force true
end
