#!/bin/bash
set -euo pipefail

DOTFILES_DIR="$(cd "$(dirname "$0")" && pwd)"
echo "==> Installing dotfiles from $DOTFILES_DIR"

cd "$DOTFILES_DIR"

# Symlink all packages
echo "==> Creating symlinks..."

# Home dotfiles
ln -sf "$DOTFILES_DIR/bash/.bashrc" ~/.bashrc
ln -sf "$DOTFILES_DIR/git/.gitconfig" ~/.gitconfig
ln -sf "$DOTFILES_DIR/Xresources/.Xresources" ~/.Xresources

# .config directories
ln -sf "$DOTFILES_DIR/nvim/.config/nvim" ~/.config/nvim
ln -sf "$DOTFILES_DIR/alacritty/.config/alacritty" ~/.config/alacritty
ln -sf "$DOTFILES_DIR/kitty/.config/kitty" ~/.config/kitty
ln -sf "$DOTFILES_DIR/hypr/.config/hypr" ~/.config/hypr
ln -sf "$DOTFILES_DIR/i3/.config/i3" ~/.config/i3
ln -sf "$DOTFILES_DIR/polybar/.config/polybar" ~/.config/polybar
ln -sf "$DOTFILES_DIR/rofi/.config/rofi" ~/.config/rofi
ln -sf "$DOTFILES_DIR/swaync/.config/swaync" ~/.config/swaync
ln -sf "$DOTFILES_DIR/waybar/.config/waybar" ~/.config/waybar
ln -sf "$DOTFILES_DIR/wofi/.config/wofi" ~/.config/wofi
ln -sf "$DOTFILES_DIR/wlogout/.config/wlogout" ~/.config/wlogout
ln -sf "$DOTFILES_DIR/mako/.config/mako" ~/.config/mako
ln -sf "$DOTFILES_DIR/yazi/.config/yazi" ~/.config/yazi
ln -sf "$DOTFILES_DIR/picom/.config/picom.conf" ~/.config/picom.conf
ln -sf "$DOTFILES_DIR/scripts/.config/scripts" ~/.config/scripts

echo "==> Dotfiles installed!"
echo "    Restart your shell or run: exec bash"
