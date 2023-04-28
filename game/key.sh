#!/bin/bash

level=$(whoami)

no='\033[0m'	    # Color Reset
ok='\033[32;01m'    # Green Ok
err='\033[31;01m'	# Error red
warn='\033[33;01m'	# Warning yellow
yell='\033[1;33m'   # Yellow
blue='\033[1;34m'   # Blue
purp='\033[1;35m'   # Purple
cyan='\033[1;36m'   # Cyan
white='\033[1;37m'  # White 

check1=false
check2=false
check3=false

if [[ $@ ]]; then
    echo -e "${warn}[${level}] Аргументы:${no} ${ok}$@${no}"
else
    echo -e "${warn}[${level}]${err} Введите три числовых аргумента для поиска пароля к следующему уровню!${no}"
    echo -e "${warn}[${level}] Данные аргументы Вы получите, выполняя задания текущего уровня${no}"
fi
if [[ $1 ]]; then
    if [[ $1 =~ ^[0-9]+$ ]]; then
        # echo -e "${warn}[${level}] Порядковый номер строки:${no} ${ok}$1${no}"
        check1=true
    else
        echo -e "${err}Введённый символ (${ok}$1${no}${err})не является числом!${no}"
        check1=false
    fi
fi
if [[ $2 ]]; then
    if [[ $2 =~ ^[0-9]+$ ]]; then
        # echo -e "${warn}[${level}] Первый символ строки:${no} ${ok}$2${no}"
        check2=true
    else
        echo -e "${err}Введённый символ (${ok}$2${no}${err}) не является числом!${no}"
        check2=false
    fi
fi
if [[ $3 ]]; then
    if [[ $3 =~ ^[0-9]+$ ]]; then
        # echo -e "${warn}[${level}] Количество символов в пароле:${no} ${ok}$3${no}"
        check3=true
    else
        echo -e "${err}Введённый символ (${ok}$3${no}${err})не является числом!${no}"
        check3=false
    fi
fi
if [ $check1 == true ] && [ $check2 == true ] && [ $check3 == true ]; then
    pass=$(sed "$1!d" /etc/opt/game/bin/all.keys | cut -c$2- | cut -c 1-$3)
    echo -e "${warn}[${level}] Возможный пароль:${no} ${ok}${pass}${no}"
else
    echo -e "${warn}[${level}]${err} Введите три числовых аргумента для поиска пароля к следующему уровню!${no}"
fi
