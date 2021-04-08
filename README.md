
                     bspwm - dotfiles

| Dark - Blue |
|-----------------------|
|![img](images/dark.png)|

<details open>
  <summary><strong>Arch Linux (and all based distributions)</strong></summary>

> used yay / paru for completely install dependency package

    $ paru -S dunst sxhkd pcmanfm python psmisc xorg-xprop xorg-xwininfo imagemagick \
      ffmpeg wireless_tools bspwm pulseaudio pulseaudio-alsa alsa-utils brightnessctl nitrogen \
      gsimplecal rofi polybar qt5-styleplugins lxsession xautolock rxvt-unicode-patched xclip scrot \
      thunar thunar-archive-plugin thunar-volman thunar-media-tags-plugin ffmpegthumbnailer tumbler viewnior \
      mpv mpd mpc networkmanager-dmenu ncmpcpp pavucontrol parcellite neofetch w3m htop picom-ibhagwan-git gtk2-perl \
      playerctl pamixer flameshot ranger nvim pipes.sh fet.sh

<details open>
  <summary><strong>Zsh - ohmyzsh (Optionaly)</strong></summary>

> optionally for customize text in terminal

    $ sudo pacman -S zsh &&
    chsh -s $(command -v zsh) &&
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" &&
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting &&
    git clone https://github.com/zsh-users/zsh-autosuggestions.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions &&
    git clone https://github.com/zsh-users/zsh-completions.git ${ZSH_CUSTOM:=~/.oh-my-zsh/custom}/plugins/zsh-completions

Credits
    [@owl4ce](https://github.com/owl4ce) |
    [@bandithijo](https://github.com/bandithijo) |
    [@6gk](https://github.com/6gk) |
    [@buffet](https://github.com/buffet/kiwmi)
