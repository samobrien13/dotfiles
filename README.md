# dotfiles
 
`https://fwuensche.medium.com/how-to-manage-your-dotfiles-with-git-f7aeed8adf8b`
 
## Installation

1. git clone --bare https://github.com/samobrien13/dotfiles.git $HOME/.cfg
2. alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
3. dotfiles checkout
