
#!/bin/bash

#created by Hikmet Kütük

# Check RAM and SWAP Usages
echo "checking ram and swap usages..."
sleep 1
free -h | grep -v + > /tmp/ramcache
echo "Ram Usages :"  >> reports/$reportname.txt
cat /tmp/ramcache | grep -v "Swap" >> reports/$reportname.txt
echo "Swap Usages :" >> reports/$reportname.txt
cat /tmp/ramcache | grep -v "Mem" >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

# Check Disk Usages
echo "checking disk usages..."
sleep 1
df -h| grep 'Filesystem\|/dev/sda*' > /tmp/diskusage
echo "Disk Usages :" >> reports/$reportname.txt
cat /tmp/diskusage >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

#--------Print top 5 most memory consuming resources---------#
echo "Top 5 Memory Resource Hog Processes: " >> reports/$reportname.txt
echo "checking memory consum..."
ps -eo pmem,pcpu,pid,ppid,user,stat,args | sort -k 1 -r | head -6|sed 's/$//' >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

#--------Print top 5 most CPU consuming resources---------#
echo "Top 5 CPU Resource Hog Processes: " >> reports/$reportname.txt
echo "checking cpu consum..."
ps -eo pcpu,pmem,pid,ppid,user,stat,args | sort -k 1 -r | head -6|sed 's/$//' >> reports/$reportname.txt
echo -e "\n" >> reports/$reportname.txt

