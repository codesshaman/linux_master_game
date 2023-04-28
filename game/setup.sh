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
lang='ru'

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

if [ $lang == 'ru' ]; then
    echo -e "${warn}[Linux Master] Начало установки${no}"
fi
if [ $lang == 'en' ]; then
    echo -e "${warn}[Linux Master] Start installation${no}"
fi

/bin/bash /home/vagrant/game/levels/level0_preparetion.sh
