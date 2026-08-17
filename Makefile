# Stow this repo's contents into $HOME, preserving structure.
# The repo itself is treated as a single stow package named "dotfiles".

PKG     := dotfiles
STOWDIR := ..
TARGET  := $(HOME)

.PHONY: install uninstall reinstall preview

install:
	stow -v -t "$(TARGET)" -d "$(STOWDIR)" $(PKG)

uninstall:
	stow -v -D -t "$(TARGET)" -d "$(STOWDIR)" $(PKG)

reinstall:
	stow -v -R -t "$(TARGET)" -d "$(STOWDIR)" $(PKG)

preview:
	stow -n -v -t "$(TARGET)" -d "$(STOWDIR)" $(PKG)
