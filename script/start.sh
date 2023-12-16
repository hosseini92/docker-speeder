#!/bin/sh

# Function to exit the script and kill the background process
exit_proc() {
    kill -SIGTERM $(pgrep sleep)
}

# Function to perform cleanup and exit
finish() {
    exit_proc
    exit 0
}

# Set trap for signals to invoke the 'finish' function
trap finish SIGTERM SIGINT SIGQUIT

# Extract binary and additional arguments
bin="$1"
extArgs="${@:2}"

# Execute the binary with arguments in the background
"$bin" $extArgs 2>&1 &

# Infinite loop with sleep
while true
do
    sleep 1d &
    wait $!
done

