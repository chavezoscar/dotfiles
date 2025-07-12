#!/usr/bin/env bash

# This script installs git fish alacritty neovim and yay and then changes shell to fish, clones my dotfiles from my git repo and then symlinks the dotfiles,then just a reboot. It also adds emojis and shit forsomething a lil extra"

set -e

echo "#!/usr/bin/env bash"
set -e

# Setting up essential packages

echo "🔧 Starting new computer setup ⚡"

echo "🤖 Installing required packages via pacman⚙️ "  
packages=(
  git
  fish
  neovim
  alacritty
  brave-bin
  steam
  lutris
)
sudo pacman -S --needed --noconfirm "${packages[@]}"

echo "✅ Packages installed:"
for pkg in "${packages[@]}"; do
  echo "  📦 $pkg"
done

# Change shell to fish
echo "Changing shell 🖥️ to fish 🐟"
chsh -s /usr/bin/fish

# Clone dotfiles from my repo
echo "Cloning 🧬 dotfiles and cd into dotfiles folder 📁"
git clone https://github.com/chavezoscar/dotfiles.git ~/dotfiles
cd ~/dotfiles

# Run dotbot and link files
echo "🔗 Linking dotfiles with Dotbot"
./install

# FInish and reboot
echo "🚀 Dotfiles installed successfully🚀"

echo ""
read -p "🌀 Reboot now? y/n: " confirm
if [[ "$confirm" =~ ^[Yy]$ ]]; then
  echo "♻️  Rebooting in 5 seconds..."
  sleep 5
  reboot
else
  echo "⚠️  Reboot skipped. Some changes may not take effect until restart."
fi
