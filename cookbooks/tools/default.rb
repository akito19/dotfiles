case node[:platform]
when 'ubuntu'
  package 'build-essential'
  package 'peco'
when 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
else
  package 'peco'
  package 'ghq'
end

ln '.peco'
package 'ripgrep'
