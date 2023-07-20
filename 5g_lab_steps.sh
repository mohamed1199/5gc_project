sudo apt install net-tools

sudo apt update
sudo apt upgrade -y

# downgrade kernel version
sudo apt install -y linux-aws-lts-20.04

sudo grep 'menuentry \|submenu ' /boot/grub/grub.cfg | cut -f2 -d "'"
sudo cp /etc/default/grub /etc/default/grub.bak

sudo nano /etc/default/grub
sudo update-grub

# check the kernel version
uname -r

# install go - version 1.17.8
sudo rm -rf /usr/local/go
wget https://dl.google.com/go/go1.17.8.linux-amd64.tar.gz
sudo tar -C /usr/local -zxvf go1.17.8.linux-amd64.tar.gz

mkdir -p ~/go/{bin,pkg,src}
echo 'export GOPATH=$HOME/go' >> ~/.bashrc
echo 'export GOROOT=/usr/local/go' >> ~/.bashrc
echo 'export PATH=$PATH:$GOPATH/bin:$GOROOT/bin' >> ~/.bashrc
echo 'export GO111MODULE=auto' >> ~/.bashrc
source ~/.bashrc

go version

sudo apt -y update
sudo apt -y install mongodb wget git
sudo systemctl start mongodb

mongod --version

sudo systemctl status mongodb

# User-plane Supporting Packages
sudo apt -y install git gcc g++ cmake autoconf libtool pkg-config libmnl-dev libyaml-dev

# Linux Host Network Settings
sudo sysctl -w net.ipv4.ip_forward=1
sudo iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
sudo iptables -A FORWARD -p tcp -m tcp --tcp-flags SYN,RST SYN -j TCPMSS --set-mss 1400
sudo systemctl stop ufw


git clone --recursive -b v3.3.0 -j `nproc` https://github.com/free5gc/free5gc.git
cd free5gc
make 

# Install WebConsole
sudo apt remove cmdtest
sudo apt remove yarn

curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -

sudo apt-get update
sudo apt-get install -y nodejs yarn

node --version

# build webconsole
make webconsole
cd webconsole
go run server.go


