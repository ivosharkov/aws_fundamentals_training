#!/bin/sh

#post deployment configuration:

## add docker ce
apt-get install   apt-transport-https     ca-certificates     curl     software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
apt-key fingerprint 0EBFCD88
add-apt-repository    "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"
apt-get update
apt-get install docker-ce

groupadd docker
usermod -aG docker ubuntu

## add docker-compose
curl -L https://github.com/docker/compose/releases/download/1.19.0/docker-compose-`uname -s`-`uname -m` -o /usr/local/bin/docker-compose
chmod +x /usr/local/bin/docker-compose


##configure index.html
public_ip=$(curl http://169.254.169.254/latest/meta-data/public-ipv4)
sed -i "s/SPRING_IO/$public_ip/g" index.html

##run docker-compose
docker-compose up -d
