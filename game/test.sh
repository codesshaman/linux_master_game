#!/bin/bash
# script -q /dev/null | sed -e 's/\r//' | while read -r line; do
#     echo "Выполнена команда: $line"
# done

#!/bin/bash
trap "echo ' Trapped Ctrl-C'" SIGINT
echo This is a test script
count=1
while [ $count -le 10 ]
do
echo "Loop #$count"
sleep 1
count=$(( $count + 1 ))
done