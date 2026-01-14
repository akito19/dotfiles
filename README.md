# Dotfiles Based on MItamae
[MItamae](https://github.com/itamae-kitchen/mitamae) is a configuration management tool.

## Installation
```
$ git clone https://github.com/akito19/dotfiles.git
$ cd dotfiles
$ ./setup.sh
```

### Options
- `--apply-only`: Skip initial setup (Xcode CLI Tools, Homebrew) and only apply configuration with mitamae

## Memo
If you want to chenge `origin` of repository, you should execute follow command.

e.g. Changing `SSH` from `https`

```
$ git remote -v  // confirmation current origin
$ git remote set-url origin git@github.com:akito19/dotfiles.git
```
