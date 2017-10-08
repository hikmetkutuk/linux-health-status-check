#!/bin/bash

#created by Hikmet Kütük


# Define Variable tecreset
tecreset=$(tput sgr0)
#Header
echo -e '\E[32m'"Status Report" $tecreset 

# Check if connected to Internet or not
echo "checking internet connection..."
sleep 1
Internet=$(ping -c 1 google.com &> /dev/null && echo "Internet: Connected" || echo "Internet:  Disconnected")
echo $Internet >> reports/$reportname.txt

# Check OS Type
echo "checking os type..."
sleep 1
os=$(uname -o)
echo "Operating System Type :" $os >> reports/$reportname.txt

# Check Architecture
echo "checking architecture..."
sleep 1
architecture=$(uname -m)
echo "Architecture :" $architecture >> reports/$reportname.txt

# Check Kernel Release
echo "checking kernel release..."
sleep 1
kernelrelease=$(uname -r)
echo  "Kernel Release :" $kernelrelease >> reports/$reportname.txt

# Check hostname
echo "checking hostname..."
sleep 1
echo "Hostname :" $HOSTNAME >> reports/$reportname.txt

# Check Internal IP
echo "checking internal ip..."
sleep 1
internalip=$(hostname -I)
echo "Internal IP :" $internalip >> reports/$reportname.txt

# Check External IP
echo "checking external ip..."
sleep 1
externalip=$(curl -s ipecho.net/plain;echo)
echo "External IP : "$externalip >> reports/$reportname.txt

# Check DNS
echo "checking dns address..."
sleep 1
nameservers=$(cat /etc/resolv.conf | sed '1 d' | awk '{print $2}')
echo "Name Servers :" $nameservers >> reports/$reportname.txt

# Check Load Average
echo "checking load average..."
sleep 1
loadaverage=$(top -n 1 -b | grep "load average:" | awk '{print $10 $11 $12}')
echo "Load Average :"  $loadaverage >> reports/$reportname.txt

# Check System Uptime
echo "checking system uptime..."
sleep 1
tecuptime=$(uptime | awk '{print $3,$4}' | cut -f1 -d,)
echo "System Uptime/(HH:MM) :" $tecuptime >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

#------Print most recent 3 reboot events if available----#
echo "Most Recent 3 Reboot Events: " >> reports/$reportname.txt
echo "checking last reboots..."
(last -x 2> /dev/null|grep reboot 1> /dev/null && /usr/bin/last -x 2> /dev/null|grep reboot|head -3 || echo  "No reboot events are recorded.") >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

#------Print most recent 3 shutdown events if available-----#
echo "Most Recent 3 Shutdown Events: " >> reports/$reportname.txt
echo "checking last shutdowns..."
(last -x 2> /dev/null|grep shutdown 1> /dev/null && /usr/bin/last -x 2> /dev/null|grep shutdown|head -3 || echo "No shutdown events are recorded.") >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt
