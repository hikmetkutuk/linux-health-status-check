
#!/bin/bash

#created by Hikmet Kütük

#--------Check for currently mounted file systems--------#
echo "checking mounted file systems..."
echo -e "\nCurrently Mounted File Systems: " >> reports/$reportname.txt
mount | egrep -iw "ext4|ext3|xfs|gfs|gfs2|btrfs"|sort -u -t' ' -k1,2 >> reports/$reportname.txt

#--------Check for any read-only file systems--------#
echo -e "\nChecking For Read-only File Systems: " >> reports/$reportname.txt
echo "checking read-only file systems..."
(echo |grep -w \(ro\) && echo -e "\nRead Only file systems found"|| echo -e "No read-only file systems found.!!") >> reports/$reportname.txt
