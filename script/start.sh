#!/bin/sh

ip=$(wget -qO- -t1 -T2 -4 ip.sb)

args="-r ${R_IP:-$ip}:$R_PORT"
bin="$1"
extArgs="${@:2}"

echo $extArgs

if [ -z "${extArgs##*' -r'*}" ]; then
    echo "use R_IP / R_PORT instead of -r"
    exit 1
fi

$bin $extArgs $args 2>&1 &

exit_proc(){
    kill -SIGTERM $(ps -e|grep sleep|grep -v grep|awk '{print $1}')
}

finish(){
    exit_proc
    exit 0
}

trap finish SIGTERM SIGINT SIGQUIT # action after receive sig

while sleep 3600 & wait $!;do :;done;
