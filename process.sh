
#!/bin/bash

#created by Hikmet Kütük


#--------Check for Processor Utilization (current data)--------#
echo "Checking For Processor Utilization:" >>reports/$reportname.txt
echo "checking process utilization..."
mpstat|tail -2 >> reports/$reportname.txt

#zombie process check
echo "checking zombie process..."
echo -e "\nZombie Process :"  >> reports/$reportname.txt
ps -eo stat|grep -w Z 1>&2 > /dev/null  >> reports/$reportname.txt

if [ $? == 0 ]
then
	echo -e "Number of zombie process on the system are :" $(ps -eo stat|grep -w Z|wc -l) >> reports/$reportname.txt
else
	echo -e "No zombie processes found on the system." >> reports/$reportname.txt
fi


