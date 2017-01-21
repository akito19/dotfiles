# TODO: あとから外にシェルとして切り出す
# execute "xcode lisence" do
#   command "xcode-select --install"
# end

execute "install Homebrew" do
  command '/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"'
end
