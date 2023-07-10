FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade && \
    apt-get -y install make g++ libsctp-dev lksctp-tools iproute2 git iptables net-tools iputils-ping snapd

RUN apt-get update && \
    apt-get install -y cmake 

RUN git clone https://github.com/aligungr/UERANSIM && \
    cd UERANSIM && git checkout v3.1.0

# COPY ./UERANSIM /UERANSIM

WORKDIR /UERANSIM 

ENTRYPOINT [ "make" ]

CMD ["build/nr-gnb", "-c", "config/free5gc-gnb.yaml"]

