case node[:platform]
when 'darwin'
  package 'node'
when 'ubuntu'
  # https://github.com/nvm-sh/nvm#git-install
else
  # nop
end
