case node[:platform]
when 'ubuntu'
  package 'build-esseltials'
  package 'peco'
when 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
else
  package 'peco'
end

ln '.peco'
package 'ripgrep'
