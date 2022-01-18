# make config dir fn
mkconfig () {
    if [[ ! -d ~/.config ]]; then
        mkdir -p ~/.config
    fi
}

write_git_config () {
    echo "Installing git configuration..."
    
    cp ./gitconfig ~/.gitconfig

    cp ./gitignore_global ~/.gitignore_global
}

# Save pwd.
SCRIPTDIR=`pwd`

# Simple argparse, don't need to be fancy
if [[ $1 == "all" ]]; then
    args=( "awesome" "nvim" "git" "powerline" "kitty" "other" )
else
    args=( "$@" )
fi

for arg in ${args[@]}; do
    case $arg in
        awesome)
            mkconfig

            if [[ ! -d ~/.config/awesome ]]; then
                echo "Cloning AwesomeWM dotfiles..."
                git clone https://github.com/warnespe001/awesome-dotfiles ~/.config/awesome > /dev/null
            else
                echo "Updating AwesomeWM dotfiles..."
            fi

            cd ~/.config/awesome
            git checkout custom-config &> /dev/null
            git pull > /dev/null

            cd - > /dev/null
        ;;
        nvim|neovim)
            mkconfig

            if [[ ! -d ~/.config/nvim ]]; then
                echo "Cloning neovim configuration..."
                git clone https://github.com/warnespe001/neovim-config ~/.config/nvim > /dev/null
            else
                echo "Updating neovim configuration..."
            fi

            cd ~/.config/nvim

            git submodule update --init > /dev/null
            git pull > /dev/null

            echo "Installing neovim plugins..."

            nvim --headless +PluginInstall +qall &> /dev/null

            cd - > /dev/null
        ;;
        git)
            if [[ ! -e ~/.gitconfig ]]; then
                write_git_config
            else
                read -p "Overwrite existing gitconfig? [y/N] " -n 1 -r

                if [[ $REPLY == "y" ]]; then
                    write_git_config
                else
                    echo "Refusing to overwrite gitconfig."
                fi
            fi
        ;;
        powerline-shell|powerline|pl)
            mkconfig

            cd /tmp

            git clone https://github.com/warnespe001/powerline-shell > /dev/null
            cd /tmp/powerline-shell
            git checkout feature/truecolor
            git pull

            # setup script requires sudo. This should initiate an askpass.
            sudo python3 setup.py install

            if [[ ! -d ~/.config/powerline-shell/themes ]]; then
                mkdir -p ~/.config/powerline-shell/themes
            fi

            cd $SCRIPTDIR

            cp ./powerline-config.json ~/.config/powerline-shell/config.json
            cp ./powerline-dracula.py ~/.config/powerline-shell/themes/dracula.py

            # Append powerline prompt command to bashrc
            # This obviously assumes the host system uses bash (which I pretty much always do)
            grep "_update_ps1" ~/.bashrc > /dev/null
            if [[ $? != 0 ]]; then
                cat ./powerline-blob >> ~/.bashrc
            fi
        ;;
        kitty)
            mkconfig

            if [[ ! -d ~/.config/kitty ]]; then
                mkdir -p ~/.config/kitty
            fi

            cp ./kitty/*.conf ~/.config/kitty/
        ;;
        other)
            echo "Installing various other configurations..."

            mkconfig

            if [[ ! -d ~/.dotfiles ]]; then
                git clone https://github.com/Jeremie1001/dotfiles ~/.dotfiles > /dev/null
            fi

            cd ~/.dotfiles/.config

            cp -r dmenu picom rofi sddm xmenu ~/.config 

            cd - > /dev/null
        ;;
        *)
            echo "Unknown option $arg"
        ;;
    esac
done


