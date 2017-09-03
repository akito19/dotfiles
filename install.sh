#!/bin/sh
set -e

~/dotfiles/bin/setup_mitamae

case "$(uname)" in
  "Darwin") ./bin/mitamae local $@ ./bootstrap.rb ;;
  *)  sudo -E bin/mitamae local $@ ./bootstrap.rb ;;
esac
