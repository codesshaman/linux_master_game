#!/bin/bash
apt update && apt install -y \
    docker-compose \
    docker \
    wget \
    curl \
    make \
    nano \
    zsh

mkdir /etc/opt/game/
mkdir /etc/opt/game/bin
touch /etc/opt/game/bin/all.keys
chmod 777 /etc/opt/game/bin/all.keys

for i in {1..1000}; do
    tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 128 >> /etc/opt/game/bin/all.keys
    echo '\n' >> /etc/opt/game/bin/all.keys
done

/bin/bash /home/vagrant/game/levels/level1.sh

sed '100!d' /etc/opt/game/bin/all.keys | cut -c100- | cut -c 1-8