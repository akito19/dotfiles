package 'tmux'

case node[:platform]
when 'darwin'
  package 'reattach-to-user-namespace'
when 'ubuntu'
  package 'xsel'
end

tpm_root = "#{ENV['HOME']}/.tmux/plugins/tpm"
git "#{tpm_root}" do
  repository "https://github.com/tmux-plugins/tpm.git"
  not_if "test -d #{tpm_root}"
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
