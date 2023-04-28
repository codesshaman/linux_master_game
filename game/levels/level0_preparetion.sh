#!/bin/bash

no='\033[0m'	    # Color Reset
ok='\033[32;01m'    # Green Ok
err='\033[31;01m'	# Error red
warn='\033[33;01m'	# Warning yellow
yell='\033[1;33m'   # Yellow
blue='\033[1;34m'   # Blue
purp='\033[1;35m'   # Purple
cyan='\033[1;36m'   # Cyan
white='\033[1;37m'  # White

echo -e "${warn}[Linux Master] Установка софта:${no} ${ok}обновление репозиториев${no}"
apt update
echo -e "${warn}[Linux Master] Установка софта:${no} ${ok}docker${no}"
apt install -y docker docker-compose
echo -e "${warn}[Linux Master] Установка софта:${no} ${ok}утилиты${no}"
apt install -y wget curl make nano

echo -e "${warn}[Linux Master] Создание каталогов${no}"
mkdir /etc/opt/game/
mkdir /etc/opt/game/bin
touch /etc/opt/game/bin/all.keys
chmod 777 /etc/opt/game/bin/all.keys

echo -e "${warn}[Linux Master] Генерация файла паролей${no}"
for i in {1..1000}; do
    tr -dc 'a-zA-Z0-9' < /dev/urandom | head -c 128 >> /etc/opt/game/bin/all.keys
    echo '\n' >> /etc/opt/game/bin/all.keys
done

echo -e "${warn}[Linux Master] Установка утилиты расшифровки ключей${no}"

cp /home/vagrant/game/key.sh /usr/local/sbin/key

chmod +x /usr/local/sbin/key
chmod 777 /usr/local/sbin/key

/bin/bash /home/vagrant/game/levels/level1.sh
