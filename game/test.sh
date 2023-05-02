#!/bin/bash
lang="ru"
if [ "$lang" == "ru" ]; then
    compath="lang/ru/level0.md"
fi
if [ "$lang" == "en" ]; then
    compath="lang/en/level0.md"
fi
compare() {
    comment="$(grep "comment${counter}" $compath | sed -r 's/.{,11}//')"
    command="$(grep "command${counter}" $compath | sed -r 's/.{,11}//')"
    echo "$comment $command"

}

# trap "echo ' Trapped Ctrl-C'" SIGINT
# echo This is a test script
# count=1
# while [ $count -le 10 ]
# do
# echo "Loop #$count"
# sleep 1
# count=$(( $count + 1 ))
# done
counter=100
compare
# trap 'echo "Enter key pressed!"' RETURN
# count=1
# while [ $count -le 10 ]
# do
# read -p "Как же меня зовут... " input
# count=$(( $count + 1 ))
# command="whoami"
if [ $input == $command ]; then
    name=$($command)
    echo "Моё имя $name"
else
    name=$($input)
    echo "$name... какое странное имя... Нет, это точно не про меня."
fi
# done

