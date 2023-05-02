#!/bin/bash
no='\033[0m'		# Color Reset
ok='\033[32;01m'    # Green Ok
err='\033[31;01m'	# Error red
warn='\033[1;33m'   # Yellow
blue='\033[1;34m'   # Blue
purp='\033[1;35m'   # Purple
cyan='\033[1;36m'   # Cyan
white='\033[1;37m'  # White
lang="ru"
if [ "$lang" == "ru" ]; then
    compath="lang/ru/level0.md"
fi
if [ "$lang" == "en" ]; then
    compath="lang/en/level0.md"
fi
compare() {
    comment="$(grep "comment${count}" $compath | sed -r 's/.{,11}//')"
    command="$(grep "command${count}" $compath | sed -r 's/.{,11}//')"
    success="$(grep "success${count}" $compath | sed -r 's/.{,11}//')"
    failure="$(grep "failure${count}" $compath | sed -r 's/.{,11}//')"
    # echo "$command $success "
}
cycle() {
    compare
    read -p "$comment" input
    if [ $input == $command ]; then
        count=$(( $count + 1 ))
        name=$($command)
        echo -e $warn$name$no
        echo -e "$ok$success$no"
    else
        name=$($input)
        echo -e "$warn$name...$no $err$failure$no"
fi
}
# trap "echo ' Trapped Ctrl-C'" SIGINT
# trap 'echo "Enter key pressed!"' RETURN
count=100
while [ $count -le 104 ]
do
cycle
done
