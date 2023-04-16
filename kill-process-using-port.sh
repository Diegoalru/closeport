#!/bin/bash

# Verify that the script is being run as root
if [ "$(id -u)" != "0" ]; then
   echo "This script must be run as root" 1>&2
   exit 1
fi

# Get the port number from the command line
port=$1

# Verify that the user has provided a port number
if [ -z "$port" ]; then
    echo "Usage: $0 <port>"
    exit 2
fi

# Verify that the port is open
if ! lsof -i :$port > /dev/null; then
    echo "Port $port is not open"
    exit 0
fi

# Get the PID of the process using the port
pid=$(lsof -i :$port | awk 'NR==2 {print $2}')

# Kill the process
echo "Killing process $pid"
kill -9 $pid

# Verify that the port is closed
if ! lsof -i :$port > /dev/null; then
    echo "Port $port is closed"
    exit 0
else
    echo "Port $port is still open"
    exit 3
fi
