package 'tmux'

case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
when 'ubuntu', 'arch'
  package 'xsel'
end

scripts = [
  "~/dotfiles/config/bin/battery",
  "~/dotfiles/config/bin/get_ssid"
]
scripts.each do |script|
  execute "copy bin/#{script}" do
    command "cp #{script} /usr/local/bin"
    not_if "test -e /usr/local/bin/#{script}"
  end
end

ln '.tmux.conf'
