execute "xcode lisence" do
  command "xcode-select --install"
end

homebrew_cmd = <<-EOS
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)" &&
  brew doctor
EOS

execute "install Homebrew" do
  command homebrew_cmd
end
