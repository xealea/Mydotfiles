#!/bin/bash

# Enable service
mpd="Mpd"
lightdm="Lightdm"
dhcpcd="Dhcpcd"
NetworkManager="NetworkManager"

tools_banner(){
 echo
 echo "Tools for enable Depedency My dotfiles" 
 echo
}
tools_banner

about(){
  echo "Name of tools: Ark-enable"
  echo "Version       : v1.0 Linux/Darwin Version"
  echo "Built         : 2021.4"
  echo "Tested on"
  echo  "     - Arch      : Arch Linux"
  echo  "     - Artix      : runit "
  echo 
  echo "Let's started"
}
about

    # systemd

if [ -n "$mpd" ]
	then
    echo
    echo "Enable mpd"
	systemctl enable mpd
    echo "Succes"
fi

if [ -n "$lightdm" ]
	then
    echo
    echo "Enable lightdm"
	systemctl enable lightdm
    echo "Succes"
fi

if [ -n "$dhcpcd" ]
	then
    echo
    echo "Enable dhcpcd"
	systemctl enable dhcpcd
    echo "Succes"
fi

if [ -n "$NetworkManager" ]
	then
    echo
    echo "Enable networkmanager"
	systemctl enable NetworkManager
    echo "Succes"
fi

exit 1