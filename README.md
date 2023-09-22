# James Chen-Smith's Dotfiles

My personal dotfiles.

## Install

```sh
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
git clone --bare git@github.com:jameschensmith/dotfiles.git "$XDG_DATA_HOME"/dotfiles.git
alias dots='git --git-dir="$XDG_DATA_HOME"/dotfiles.git --work-tree="$HOME"'
dots checkout
dots config --local status.showUntrackedFiles no
```

## Uninstall

```sh
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
dots rm -rf "$HOME"
rm -rf "$XDG_DATA_HOME"/dotfiles.git
```

## Public Domain

In an effort to dedicate all of my work to the public domain, copyright and
related rights worldwide are waived through the [Blue Oak Model License
1.0.0](https://blueoakcouncil.org/license/1.0.0) for software and the [CC0 1.0
Universal public domain
dedication](https://creativecommons.org/publicdomain/zero/1.0/) for all other
content. For the software, please ensure you comply with the terms of the
license.

See [COPYING](./COPYING) for details.
