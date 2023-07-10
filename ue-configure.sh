echo "UE configuration:"
echo -n "please enter the MCC: "
read -r MCC
echo -n "please enter the MNC: "
read -r MNC
echo -n "please enter the SUPI: "
read -r SUPI
echo -n "please enter Permanent subscription key(K): "
read -r K
echo -n "please enter the Operator code (OPc): "
read -r OPC
echo -n "please enter the Data Network Name: "
read -r DNN
echo "NSSAI configuration"
echo -n "please enter the SST: "
read -r SST
echo -n "please enter the SD: "
read -r SD

sed -i  "s/supi:.*/supi: 'imsi-$SUPI'/g" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "s/mcc:.*/mcc: '$MCC'/g" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "s/mnc:.*/mnc: '$MNC'/g" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "s/key:.*/key: '$K'/g" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "s/op:.*/op: '$OPC'/g" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "s/apn:.*/apn: '$DNN'/" /home/ubuntu/ueransim/files/free5GC-ue.yaml
#the first pattern is change onlu from the first line to the first occuerence of sst , so this chage only the first occurence of sst
sed -i "0,/sst:.*/s/sst:.*/sst: 0x0$SST/" /home/ubuntu/ueransim/files/free5GC-ue.yaml
sed -i "0,/sd:.*/s/sd:.*/sd: 0x$SD/" /home/ubuntu/ueransim/files/free5GC-ue.yaml