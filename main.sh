      
#!/bin/bash

#created by Hikmet Kütük

#Main Script

clear

reportname=$(date '+%m-%d-%Y-%H:%M:%S')
touch reports/$reportname.txt

#included script
source sysinfo.sh 
source resusage.sh
source process.sh
source filesys.sh
source security.sh
source services.sh

source options.sh
echo -e "\n"


