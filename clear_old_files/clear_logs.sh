FILESYSTEM=/dev/vda1 # or whatever filesystem to monitor
CAPACITY=95 # delete if FS is over 95% of usage 
LOGDIR1=/var/rtb/logs/
LOGDIR2=/opt/tomcat/logs/

# Proceed if filesystem capacity is over than the value of CAPACITY (using df POSIX syntax)
# using [ instead of [[ for better error handling.
if [ $(df -P $FILESYSTEM | awk '{ gsub("%",""); capacity = $5 }; END { print capacity }') -gt $CAPACITY ]
then
    find "$LOGDIR1" -mtime +7 -delete;
    find "$LOGDIR2" -mtime +7 -delete;
fi
