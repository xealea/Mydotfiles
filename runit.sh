#!/bin/bash

# Enable service
mpd="Mpd"
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

# runit

if [ -n "$mpd" ]
	then
    echo
    echo "Enable mpd"
	ln -s /etc/runit/sv/mpd /run/runit/service
    echo "Succes"
fi

if [ -n "$dhcpcd" ]
	then
    echo
    echo "Enable dhcpcd"
	ln -s /etc/runit/sv/dhcpcd /run/runit/service
    echo "Succes"
fi

if [ -n "$NetworkManager" ]
	then
    echo
    echo "Enable networkmanager"
	ln -s /etc/runit/sv/NetworkManager /run/runit/service
    echo "Succes"
fi

exit 1