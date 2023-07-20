#tcp dump
sudo tcpdump -i any -w "/downloads/test_traffic.pcap"

ip -4 a | grep inet

#check node activity
systemctl is-active amf
systemctl status amf

# In order to investigate further, we can check the logs of the AMD for any error output  using  the following commands
journalctl -xe -u amf

docker run -v ~/files/config:/ueransim/config

docker build -t ueransim:gnb .
docker build -t ueransim:ue .

docker volume create --driver local -o o=bind -o type=none -o device=~/files ue_gnb_files

docker run -it --name gnb_dkr --mount source=ue_gnb_files,destination=/ueransim/config ueransim:gnb bash
docker run -it --name ue_dkr --device=/dev/net/tun --cap-add=NET_ADMIN --mount source=ue_gnb_files,destination=/ueransim/config ueransim:ue bash

docker start gnb_dkr -i 
./nr-gnb -c ./config/free5gc-gnb.yaml

docker start ue_dkr -i 
./nr-ue -c ./config/free5gc-ue.yaml


sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo systemctl stop ufw
sudo iptables -I FORWARD 1 -j ACCEPT

docker exec -it ue_dkr bash 
ping -I uesimtun0 google.com
traceroute -i uesimtun0 google.com



docker run -it --name gnb_test --mount source=ue_gnb_files,destination=/ueransim/config gnb:latest

docker run -it --name ue_test --device=/dev/net/tun --cap-add=NET_ADMIN --mount source=ue_gnb_files,destination=/ueransim/config ue:latest

docker logs -f <container_id_or_name>

 pgrep -f "nrf|amf|smf|udr|pcf|udm|nssf|ausf" | xargs ps -p



 if pgrep -f "nrf|amf|smf|udr|pcf|udm|nssf|ausf" >/dev/null; then
  echo -e "\e[1;32mActive\e[0m"
  echo -e "\e[1;32mActive\e[0m"
else
  echo -e "\e[1;31mDeactive\e[0m"
fi


docker exec -it ue_test bash -c "ping -I uesimtun0 google.com"

nr-cli <node-name>

./nr-cli imsi-208930000000003 --exec "deregister normal"

docker exec -it ue_test bash -c ' ./nr-cli imsi-208930000000003 --exec "deregister normal" '