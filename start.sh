#!/bin/bash

no='\033[0m'		# Color Reset
ok='\033[32;01m'    # Green Ok
err='\033[31;01m'	# Error red
warn='\033[1;33m'   # Yellow
blue='\033[1;34m'   # Blue
purp='\033[1;35m'   # Purple
cyan='\033[1;36m'   # Cyan
white='\033[1;37m'  # White
lang=0
confirm() {
    read -r -p "${1:-Are you sure? [y/N]} " response
    case "$response" in
        [yY][eE][sS]|[yY])
            true
            ;;
        *)
            false
            ;;
    esac
}

echo -e "${warn}[Linux Master]${no} ${cyan}[0]${no}${warn} - launch setup in${no} ${cyan}English${no}"
echo -e "${warn}[Linux Master]${no} ${cyan}[1]${no}${warn} - Запустить установку на${no} ${cyan}Русском${no}"
read lang
if [ $lang == 0 ] || [ $lang == 1 ]; then
    if [ $lang == 0 ]; then
        echo -e "${warn}[Linux Master] Start installation in English!${no}"
        sed -i "s!lang='ru'!lang='en'!1" game/setup.sh
        echo -e "${warn}[Linux Master] Start launching with command${no} ${ok}make${no}"
    fi
    if [ $lang == 1 ]; then
        echo -e "${warn}[Linux Master] Устанавливаю игру на Русском!${no}"
        sed -i "s!lang='en'!lang='ru'!1" game/setup.sh
        echo -e "${warn}[Linux Master] Запустите установку командой${no} ${ok}make${no}"
    fi
else
    echo -e "${err}Choose only 0 or 1${no}"
    echo -e "${err}Выберите между 0 и 1${no}"
fi
