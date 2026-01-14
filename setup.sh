#!/bin/sh
set -e

APPLY_ONLY=false

# Parse arguments
args=""
for arg in "$@"; do
  case $arg in
    --apply-only)
      APPLY_ONLY=true
      ;;
    *)
      args="$args $arg"
      ;;
  esac
done

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

# Initial setup (skip with --apply-only)
if [ "$APPLY_ONLY" = false ]; then
  if is_setup 'Xcode Command Line Tools'; then
    xcode-select --install
  fi

  if is_setup 'Homebrew'; then
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
    brew doctor
  fi
fi

# Apply configuration with mitamae
~/dotfiles/bin/setup_mitamae

case "$(uname)" in
  "Darwin") ./bin/mitamae local $args ./bootstrap.rb ;;
  *)  sudo -E bin/mitamae local $args ./bootstrap.rb ;;
esac
