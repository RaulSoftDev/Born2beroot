#!/bin/bash

# OS Architecture / Kernel version
echo -n "#Architecture: " && uname -a

# CPU physical cores
socket=$(lscpu | grep "Socket(s)" | tr -d -c 0-9)
cpu=$(lscpu | grep "Core(s) per socket:" | tr -d -c 0-9)
phycpu=$((cpu * socket))
echo -n "#CPU physical: " && echo $phycpu

# CPU virtual cores
threads=$(lscpu | grep "Thread(s) per core:" | tr -d -c 0-9)
vcpu=$((cpu * threads * socket))
echo -n "#vCPU: " && echo $vcpu

# Available RAM memory / Usage
totalmem=$(grep "MemTotal" /proc/meminfo | tr -d -c 0-9)
totalram=$(($totalmem / 1000))
freemem=$(grep "MemFree" /proc/meminfo | tr -d -c 0-9)
freeram=$(($freemem / 1000))
usage=$(($totalram - $freeram))
rawusage=$(bc <<< "scale=4;$usage / $totalram")
pcusage=$(bc <<< "$rawusage * 100")
rdusage=$(printf "%.2f" $pcusage)
echo -n "#Memory Usage: $usage/$totalram" && echo -n "MB" && echo -n " ($rdusage" && echo "%)"

# Available space memory / Usage
freespace=$(df -m /home/ | grep "/home" | awk '{print $4}')
totalspace=$(df -m /home/ | grep "/home" | awk '{print $2}')
totalspacegb=$(bc <<< "scale=2;$totalspace / 1000")
rtotalspace=$(printf "%.2f" $totalspacegb)
spaceusage=$(($totalspace - $freespace))
spaceusagegb=$(bc <<< "scale=2;$spaceusage / 1000")
rspaceusage=$(printf "%.2f" $spaceusagegb)
pcspaceusage=$(df -m /home/ | grep "/home" | awk '{print $5}')
echo -n "#Disk Usage: $rspaceusage" && echo -n "/$rtotalspace" && echo -n "Gb" && echo " ($pcspaceusage)"

# CPU load
cpuload=$(uptime | awk '{print $9}' | sed 's/,//')
echo "#CPU load: $cpuload%"

# Last boot
lbdate=$(who -b | awk '{print $3}')
lbtime=$(who -b | awk '{print $4}')
echo "#Last boot: $lbdate $lbtime"

# LVM check
lvmdata=$(lsblk | grep "lvm" | wc -l)
lvmcheck=$(echo $lvmdata | awk '{print $1}')
if (($lvmcheck == 0));
then
	echo "#LVM use: no"
else
	echo "#LVM use: yes"
fi

# TCP Connections
tcpconnections=$(ss -t -a | grep ESTAB | wc -l)
echo "#TCP Connections : $tcpconnections ESTABLISHED"

# Logged in users
userlogs=$(w | grep "user" | awk '{print $5}')
echo "#User log: $userlogs"

# Network
rawip=$(ip addr show | grep "enp0s3" | grep "inet" | awk '{print $2}')
ip=$(echo $rawip | sed -r 's/.{3}$//')
mac=$(ip addr show | grep "ether" | head -1 | awk '{print $2}')
echo "#Network: IP $ip ($mac)"

# Sudo
sudo=$(journalctl | grep sudo | grep "COMMAND" | wc -l)
echo "#Sudo : $sudo cmd"
