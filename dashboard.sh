#CPU and Memory info
printf "\nCPU AND MEMORY RESOURCES --------------------------------\n"
cpu_load=`uptime | awk '{print $8, $9, $10}'`
free_ram=`free --mega | awk '/Mem/ {print $4 " MB"}'`
printf "CPU Load Average: ${cpu_load}	Free RAM: ${free_ram}"
unset cpu_load
unset free_ram

#Network info
printf "\n\nNETWORK CONNECTIONS -------------------------------------\n"
cat /proc/net/dev | awk 'FNR > 2 {print substr($1,0,length($1)-1) " Bytes Received: " $2 "     Bytes Transmitted: " $10}' | sort -r
echo -n Internet Connectivity: 
if [[ "`ping -c 1 8.8.8.8 | grep '100% packet loss'`" != "" ]]; then
	echo No
else
	echo Yes
fi

#Account information
printf "\nACCOUNT INFORMATION -------------------------------------\n"
printf "Total Users: %d		Number Active: %d\n" `cat /etc/passwd | wc -l` `w -h | wc -l`
printf "Shells: \n" 
cat /etc/passwd | awk -F: '{print $7}' | sort | uniq -c | awk '{print $2 " " $1}'

#filesysystem info
printf "\nFILESYSTEM INFORMATION ----------------------------------\n"
printf "Total Number of Files: %s\n" `find / -type f | wc -l`
printf "Total Number of Directories: %s\n\n" `find / -type d | wc -l`
