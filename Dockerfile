FROM free5gc/ueransim:latest


COPY ./config/free5gc-gnb.yaml /ueransim/config/free5gc-gnb.yaml
COPY ./config/free5gc-ue.yaml /ueransim/config/free5gc-ue.yaml

WORKDIR /ueransim

# CMD ["./nr-gnb", "-c", "./config/free5gc-gnb.yaml"]

CMD ["bash"]

