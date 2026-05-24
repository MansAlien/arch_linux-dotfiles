# MansAlien's Dotfiles

Catppuccin Mocha-themed dotfiles for Arch Linux, supporting both **i3 (X11)** and **Hyprland (Wayland)**.

## What's Included

| Category | Apps | Session |
|----------|------|---------|
| **Shell** | Bash + oh-my-posh | both |
| **Git** | git + delta diff pager | both |
| **X11 WM** | i3 + polybar + picom + dunst | X11 |
| **Wayland WM** | Hyprland + waybar + swaync + wlogout + hyprlock | Wayland |
| **Terminals** | Alacritty (X11), Kitty (Wayland) | per-session |
| **Launcher** | Rofi (X11), Wofi (Wayland) | per-session |
| **Editor** | Neovim (lazy.nvim, LSP, telescope, completions) | both |
| **File Manager** | Yazi (terminal file manager) | both |
| **Notifications** | Mako (Wayland) / dunst (X11) | per-session |
| **Clipboard** | clipse | Wayland |
| **Wallpaper** | swww (Wayland) / nitrogen (X11) | per-session |
| **Theme** | Catppuccin Mocha across all apps | both |
| **DPI** | Xresources (120 DPI) | X11 |

## Directory Structure

```
~/Alien/dotfiles/
├── install.sh              # Bootstrap script (creates symlinks)
├── bash/.bashrc            # Shell config
├── git/.gitconfig          # Git config
├── Xresources/.Xresources  # X11 DPI settings
├── alacritty/              # Terminal (X11)
├── kitty/                  # Terminal (Wayland)
├── hypr/                   # Hyprland compositor
├── i3/                     # i3 window manager
├── polybar/                # Status bar (X11)
├── waybar/                 # Status bar (Wayland)
├── rofi/                   # App launcher (X11)
├── wofi/                   # App launcher (Wayland)
├── swaync/                 # Notification center (Wayland)
├── mako/                   # Notifications (Wayland)
├── wlogout/                # Logout menu (Wayland)
├── nvim/                   # Neovim config
├── yazi/                   # File manager
├── picom/                  # X11 compositor
├── scripts/                # Utility scripts
└── themes/                 # Extra themes
```

## Fresh Arch Install

### 1. Install Packages

```bash
# Base
sudo pacman -S --needed git base-devel

# AUR helper (yay)
git clone https://aur.archlinux.org/yay.git /tmp/yay
cd /tmp/yay && makepkg -si && cd

# X11 / i3 session
sudo pacman -S --needed \
  i3-wm polybar rofi picom nitrogen dunst \
  kitty alacritty maim xss-lock \
  brightnessctl playerctl libinput-gestures \
  ttf-jetbrains-mono-nerd otf-font-awesome \
  noto-fonts noto-fonts-emoji

# Wayland / Hyprland session
sudo pacman -S --needed \
  hyprland waybar wofi wlogout swaync mako \
  swww hyprlock hypridle grimblast-git \
  fcitx5 fcitx5-mozc fcitx5-configtool

# Both sessions
sudo pacman -S --needed \
  neovim yazi nodejs npm python \
  rustup go bluez bluez-utils blueman \
  networkmanager network-manager-applet \
  pulseaudio pavucontrol pulseaudio-bluetooth

# Extra utilities
sudo pacman -S --needed \
  thunar gvfs file-roller \
  keepassxc

# AUR packages
yay -S --needed \
  oh-my-posh-bin \
  catppuccin-gtk-theme papirus-icon-theme \
  clipse
```

### 2. Clone Dotfiles

```bash
git clone https://github.com/MansAlien/arch_linux-dotfiles ~/Alien/dotfiles
```

### 3. Install (Symlink)

```bash
bash ~/Alien/dotfiles/install.sh
exec bash
```

### 4. Choose Your Session

**i3 (X11):**
```bash
echo "exec i3" > ~/.xinitrc
startx
```

**Hyprland (Wayland):**
```bash
sudo pacman -S --needed sddm
sudo systemctl enable --now sddm
# Select Hyprland from SDDM
```

## Manual Configs Not in Repo

These are referenced but have no dotfile — create them manually:

- `~/.face` — user avatar (used by hyprlock)
- `~/.config/dunst/dunstrc` — dunst notifications (i3)
- `~/Pictures/Screenshots/` — screenshot directory
- `~/themes/mytheme.omp.json` — oh-my-posh theme

## Keybinds

### i3
| Key | Action |
|-----|--------|
| `$mod+Return` | Terminal (kitty) |
| `$mod+p` | App launcher (rofi) |
| `$mod+q` | Kill window |
| `$mod+h/j/k/l` | Focus direction |
| `$mod+Shift+h/j/k/l` | Move window direction |
| `$mod+1-5` | Switch workspace |
| `$mod+Shift+1-5` | Move to workspace |
| `$mod+f` | Fullscreen |
| `$mod+v` | Split vertical |
| `$mod+b` | Split horizontal |
| `$mod+Shift+r` | Restart i3 |
| `Print` | Screenshot |
| `$mod+Shift+x` | Lock |
| `$mod+Shift+s` | Suspend |

### Hyprland
| Key | Action |
|-----|--------|
| `$mainMod+Return` | Terminal (alacritty) |
| `$mainMod+R` | App launcher (wofi) |
| `$mainMod+Q` | Kill active |
| `$mainMod+Ctrl+Shift+Q` | Exit Hyprland |
| `$mainMod+H/J/K/L` | Focus direction |
| `$mainMod+Shift+H/J/K/L` | Move window |
| `$mainMod+1-0` | Switch workspace |
| `$mainMod+Shift+1-0` | Move to workspace |
| `$mainMod+F` | Fullscreen |
| `$mainMod+V` | Toggle float |
| `$mainMod+S` | Scratchpad |
| `$mainMod+Ctrl+Shift+L` | Lock (hyprlock) |
| `Print` | Screenshot area |
| `$mainMod+Shift+V` | Clipboard (clipse) |

## Troubleshooting

**Waybar/Polybar not showing:**
```bash
killall waybar && waybar &    # Wayland
killall polybar && ~/.config/polybar/launch.sh  # X11
```

**Wofi/Rofi not launching:**
```bash
wofi --show drun              # Wayland
rofi -show drun               # X11
```

**Wallpaper not set (Hyprland):**
```bash
swww img ~/.config/hypr/background
```

**Notifications not working:**
```bash
killall mako && mako &        # Wayland
killall dunst && dunst &      # X11
```

**Re-apply all symlinks:**
```bash
bash ~/Alien/dotfiles/install.sh
```
