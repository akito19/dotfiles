case node[:platform]
when 'ubuntu'
  package 'build-esseltials'
  package 'peco'
when 'arch'
  include_cookbook 'yaourt'
  yaourt 'peco'
when
  package 'peco'
end

ln '.peco'
package 'ripgrep'
