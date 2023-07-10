FROM ubuntu:20.04

ENV DEBIAN_FRONTEND noninteractive

RUN apt-get update && apt-get upgrade && \
    apt-get -y install make g++ libsctp-dev lksctp-tools iproute2 iptables net-tools iputils-ping snapd

RUN apt-get update && \
    apt-get install -y cmake 

COPY ./UERANSIM /UERANSIM

WORKDIR /UERANSIM 

RUN make

CMD ["build/nr-gnb", "-c", "config/free5gc-gnb.yaml"]

