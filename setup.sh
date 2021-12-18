echo "Cloning AwesomeWM dotfiles..."

if [[ ! -d "~/.config" ]]; then
    mkdir -p ~/.config
fi

git clone https://github.com/warnespe001/awesome-dotfiles ~/.config/awesome

cd ~/.config/awesome

echo "Checking out latest Awesome config..."

git checkout custom-config

git pull

echo "Cloning neovim configuration..."

git clone https://github.com/warnespe001/neovim-config ~/.config/nvim

cd ~/.config/nvim

git submodule update --init

echo "Installing neovim plugins..."

nvim --headless +PluginInstall +qall &> /dev/null

echo "Installing various other configurations..."

git clone https://github.com/Jeremie1001/dotfiles ~/.dotfiles

cd ~/.dotfiles/.config

cp -r dmenu picom rofi sddm xmenu ~/.config 
