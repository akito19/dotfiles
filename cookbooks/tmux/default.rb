package 'tmux'
package 'reattach-to-user-namespace'

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
