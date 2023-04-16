# Bash Script to Kill a Process using a Port Number

This is a simple Bash script that can be used to kill a process running on a specified port number.

## Requirements

* Bash shell environment
* Root access or sudo privileges
* `lsof` command should be installed

## Usage

The script can be executed using the following command:

```
sudo ./kill-process-using-port.sh
```

Replace `<port_number>` with the port number on which the process is running.

## Description

The script checks if it is being run as root, if not, it exits with an error message. It then takes the port number as input from the command line and verifies if it has been provided. If not, it exits with a usage message.

Next, it checks if the port is open using the `lsof` command. If the port is not open, the script exits with a message indicating the same.

If the port is open, the script gets the PID of the process using the port and kills it using the `kill` command.

Finally, it checks if the port is closed using the `lsof` command. If the port is closed, the script exits with a message indicating the same. If the port is still open, it exits with an error message.

## Disclaimer

Use this script at your own risk. Killing a process can have unintended consequences, and it is recommended to use this script only if you know what you are doing.
