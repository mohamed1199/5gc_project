 CMD ["bash"]

/bin/sh -c apt-get update && apt-get -y install make g++ libsctp-dev lksctp-tools git vim iproute2s iptables net-tools ifupdown iputils-ping wget libssl-dev

/bin/sh -c git clone https://github.com/aligungr/UERANSIM && cd UERANSIM && git checkout v3.1.0 && make

WORKDIR /UERANSIM/build

build/nr-gnb -c config/free5gc-gnb.yaml