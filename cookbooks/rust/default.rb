rustc_path = "#{ENV['HOME']}/.cargo/bin/rustc"

if node[:platform] == 'darwin'
  execute 'install Rust' do
    command "curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh"
    not_if "test -e #{rustc_path}"
  end
else
  # TODO
  MItamae.logger.info("It hasn't set recipe...")
end

package 'ripgrep'

# Need for alacritty(Copy & Paste)
package 'xclip'
