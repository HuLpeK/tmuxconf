# Simple repo to store all dotfiles in one place

Usage:
```
  ❯ alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
  ❯ git clone --bare https://github.com/HuLpeK/dotfiles $HOME/.dotfiles
  ❯ dotfiles config --local status.showUntrackedFiles no
  ❯ dotfiles checkout
```

