# My Dotfiles Based on MItamae
ref: [MItamae](https://github.com/k0kubun/mitamae)

## Installation
If you use macOS, you can execute follow command:

```
$ curl -L https://raw.githubusercontent.com/akito19/dotfiles/master/init.sh | bash
```

## Manual Installation
```
$ git clone git@github.com:akito19/dotfiles.git
$ cd dotfiles
$ ./init.sh
$ ./install.sh
```

## Memo
If you want to chenge `origin` of repository, you should execute follow command.

e.g. Changing `SSH` from `https`

```
$ git remote -v  // confirmation current origin
$ git remote set-url origin git@github.com:akito19/dotfiles.git
```
