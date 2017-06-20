pyenv_root = "#{ENV['HOME']}/.pyenv"
git "#{pyenv_root}/.pyenv" do
  repository "https://github.com/pyenv/pyenv.git"
  not_if "test -d #{pyenv_root}"
end

package 'pip3'

# TODO: Write Python versions and set global
