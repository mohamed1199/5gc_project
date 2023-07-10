sudo apt update
sudo apt upgrade

sudo apt install net-tools

sudo apt update

#downgrade kernel version
sudo apt install -y linux-aws-lts-20.04
sudo grep 'menuentry \|submenu ' /boot/grub/grub.cfg | cut -f2 -d "'"

#5gc status
#!/bin/bash
#NRF > UDR > UDM > AUSF > NSSF > AMF > PCF > UPF > SMF > N3IWF
if [[ "$1" == "up" ]];then
#call all systemd
#sudo rm /dev/mqueue/*
sudo systemctl start  nrf
sudo systemctl start  udr
sudo systemctl start  udm
sudo systemctl start  ausf
sudo systemctl start  nssf
sudo systemctl start  amf
sudo systemctl start  pcf
sudo systemctl start  upf
sudo systemctl start  smf
sudo systemctl start  n3iwf
#NRF > UDR > UDM > AUSF > NSSF > AMF > PCF > UPF > SMF > N3IWF
elif [[ "$1" == "down" ]];then
sudo systemctl stop  nrf
sudo systemctl stop  udr
sudo systemctl stop  udm
sudo systemctl stop  ausf
sudo systemctl stop  nssf
sudo systemctl stop  amf
sudo systemctl stop  pcf
sudo systemctl stop  upf
sudo systemctl stop  smf
sudo systemctl stop  n3iwf
elif [[ "$1" == "status" ]];then
#NRF > UDR > UDM > AUSF > NSSF > AMF > PCF > UPF > SMF > N3IWF
sudo systemctl status nrf
sudo systemctl status  udr
sudo systemctl status  udm
sudo systemctl status  ausf
sudo systemctl status  nssf
sudo systemctl status  amf
sudo systemctl status  pcf
sudo systemctl status  upf
sudo systemctl status  smf
sudo systemctl status  n3iwf
else
echo "$1 is not a valid option";
fi;

