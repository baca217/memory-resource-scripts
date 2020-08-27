while :
do
	if [  $(df | awk '/[^/]\/boot$/ {print $5}' | tr -d %) -gt 0 ]
	then
		echo "WARNING: Space utilization is above 80% for root" | mail -s "System Space WARNING!" root@localhost
	fi

	if [ $(df | awk '/\/$/ {print $5}' | tr -d %) -gt 0 ]
	then
		echo "WARNING: Space utilization is above 80% for boot" | mail -s "System Space WARNING!" root@localhost
	fi
	sleep 5
done
