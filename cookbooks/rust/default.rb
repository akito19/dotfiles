rustc_path = "#{ENV['HOME']}/.cargo/bin/rustc"

if node[:platform] == 'darwin'
  execute 'install Rust' do
    command 'curl https://sh.rustup.rs -sSf | sh'
    not_if "test -e #{rustc_path}"
  end
else
  # TODO
  MItamae.logger.info("It hasn't set recipe...")
end

# Need for alacritty(Copy & Paste)
package 'xclip'
