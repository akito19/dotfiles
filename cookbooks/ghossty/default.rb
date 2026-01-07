directory "#{ENV['HOME']}/.config/ghostty" do
  action :create
  not_if "test -d #{ENV['HOME']}/.config/ghostty"
end

link "#{ENV['HOME']}/.config/ghostty/config" do
  to "#{ENV['HOME']}/dotfiles/config/ghostty_config"
  force true
end


