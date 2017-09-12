# Dotfiles Based on MItamae
[MItamae](https://github.com/itamae-kitchen/mitamae) is a configuration management tool.

## Installation
If you use macOS, you can execute follow command:

```
$ curl -sfSL https://raw.githubusercontent.com/akito19/dotfiles/master/init.sh | sh
```

*It doesn't work because of infinit loop in running this command...*
*I'll fix it some day.*

## Manual Installation
```
$ git clone https://github.com/akito19/dotfiles.git
$ cd dotfiles
$ ./init.sh
```

## Memo
If you want to chenge `origin` of repository, you should execute follow command.

e.g. Changing `SSH` from `https`

```
$ git remote -v  // confirmation current origin
$ git remote set-url origin git@github.com:akito19/dotfiles.git
```
