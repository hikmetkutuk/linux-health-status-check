
#!/bin/bash

#created by Hikmet Kütük

#Check SELinux
echo "checking SELinux status..."
sleep 1
echo -e "\nSELinux status: \n" $(grep -v ^# /etc/selinux/config) >> reports/$reportname.txt

#Check for open ports
echo "checking open ports..."
sleep 1
echo -e "\nOpen ports: " >> reports/$reportname.txt 
netstat -tulpn  >> reports/$reportname.txt  

