execute "xcode lisence" do
  command "xcode-select --install"
end

execute "install Homebrew" do
  command 'ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
end
