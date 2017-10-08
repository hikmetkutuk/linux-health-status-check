
#!/bin/bash

#created by Hikmet Kütük

echo -n "Would you like to view the report file ? [e/h]: "
read ans
e="e"
h="h"


if [ $ans == $e ]
then
	gedit reports/$reportname.txt
elif [ $ans == $h ]
then 
	exit 1
else
	echo -e "\n!!! incorrect character entry !!!!"
fi

echo -e "\n"
