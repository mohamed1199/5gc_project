
#tcp dump
sudo tcpdump -i any -w "/downloads/test_registration_new_user.pcap"

#check node activity
systemctl is-active amf