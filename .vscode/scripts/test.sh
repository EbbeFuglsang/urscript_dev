#echo $1
#cat $1 | nc localhost 30003 &>/dev/null

#echo "popup(99)" | nc localhost 30003 &>/dev/null

#echo "popup(99)" 
#cat $1 | nc localhost 30003 &>/dev/null

printf "def prog():\n%s\nend\n" "$(cat $1)" | nc localhost 30003 &>/dev/null &
sleep 3

#echo "def prog():\n" | cat - $1 | cat - 
#cat $1 | nc localhost 30003 &>/dev/null
