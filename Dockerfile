FROM free5gc/ueransim:latest

RUN apt update && apt-get -y install vim iptables net-tools iputils-ping wget 

# COPY ./config/free5gc-gnb.yaml /ueransim/config/free5gc-gnb.yaml
# COPY ./config/free5gc-ue.yaml /ueransim/config/free5gc-ue.yaml

WORKDIR /ueransim

# CMD ["./nr-gnb", "-c", "./config/free5gc-gnb.yaml"]

CMD ["bash"]

CMD ["/bin/bash", "-c", "./nr-gnb -c ./config/free5gc-gnb.yaml"]

CMD ["/bin/bash", "-c", "./nr-ue -c ./config/free5gc-ue.yaml"]

# ./nr-gnb -c ./config/free5gc-gnb.yaml
