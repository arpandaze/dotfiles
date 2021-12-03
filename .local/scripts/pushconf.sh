cdir=$(pwd)

if [ -d "/var/tmp/configs_push/configs" ]
then
    cd /var/tmp/configs_push/configs/ && git pull
else
    take /var/tmp/configs_push/ && git clone git@github.com:arpandaze/dotfiles.git
fi

if [ "$(uname)" == "Darwin" ]; then
    git checkout mac
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
    cp -r ~/.zshrc /var/tmp/configs_push/configs/zsh/
    cp -r ~/.local/scripts/ /var/tmp/configs_push/configs/.local
    cp -r ~/.xmonad /var/tmp/configs_push/configs/
    cp -r ~/.xprofile /var/tmp/configs_push/configs/
    cp -r ~/.xinitrc /var/tmp/configs_push/configs/
    cp -r ~/.config/xmobar /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/alacritty /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/nvim /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/vifm /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/fontconfig /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/nitrogen /var/tmp/configs_push/configs/.config/
    cp -r ~/.config/nvim /var/tmp/configs_push/configs/.config/
    cp -r /usr/share/backgrounds /var/tmp/configs_push/configs/
    cp -r ~/.config/script/install.sh /var/tmp/configs_push/configs/

    rm /var/tmp/configs_push/configs/packages.txt
    pacman -Qe >> /var/tmp/configs_push/configs/packages.txt

    git add .
    git commit -m "Update: Pushconf at: [$(date '+%d/%m/%Y %H:%M:%S')]"
    git push
fi

cd $cdir
