# https://github.com/k0kubun/dotfiles/blob/master/cookbooks/yaourt/default.rb
define :yaourt do
  name = params[:name].shellescape
  execute "yaourt -S --noconfirm #{name}" do
    not_if "yaourt -Q #{name} || yaourt -Qg #{name}"
    if ENV['SUDO_USER']
      user ENV['SUDO_USER']
    end
  end
end
