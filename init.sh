#!/bin/sh
set -e

is_setup() {
  echo "Do you setup $1? [y/N]"
  while :
  do
    read -r answer
    case $answer in
      'yes' | 'y') return 0 ;;
      [nN]o | 'N') return 1 ;;
      *) echo "Try again because you input incorrect letter. Do you setup $1? [y/N]" ;;
    esac
  done
}

if is_setup 'Xcode Command Line Tools'; then
  xcode-select --install
fi

if is_setup 'Homebrew'; then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  brew doctor
fi

if [ ! -d $HOME/dotfiles ]; then
  git clone https://github.com/akito19/dotfiles.git ~/dotfiles
fi

~/dotfiles/install.sh
