pyenv_root = "#{ENV['HOME']}/.pyenv"
git "#{pyenv_root}" do
  repository "https://github.com/pyenv/pyenv.git"
  not_if "test -d #{pyenv_root}"
end

# TODO: Write Python versions and set global
# 1. clone pyenv
# 2. `$ cd .pyenv/plugins/python-build`
# 3. `./install.sh`
# 4. `$ pyenv install VERSIONS`
# 5. `$ pyenv global VERSION`
