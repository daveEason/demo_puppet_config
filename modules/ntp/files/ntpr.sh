## Simple script to re-set ntp date from the command line
# useful for running when virtual machines wake up from standby mode.
echo "Re-starting ntpd server now...   "
echo "Stopping ntpd server now"
service ntpd stop
echo "..."
sleep 2
## Do a hard reset of ntp using ntpdate.
ntpdate pool.ntp.org
sleep 2
echo "Starting ntpd server"
service ntpd start
echo "All done!!!"
