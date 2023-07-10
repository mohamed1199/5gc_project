FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && \
    apt-get -y install apt-utils make g++ libsctp-dev lksctp-tools git vim iproute2 iptables net-tools ifupdown iputils-ping wget libssl-dev snapd

RUN snap install cmake --classic    

COPY /home/ubuntu/UERANSIM /UERANSIM

WORKDIR /UERANSIM 

RUN make

CMD ["build/nr-gnb", "-c", "config/free5gc-gnb.yaml"]

