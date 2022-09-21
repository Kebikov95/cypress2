echo "restart Xvfb"
pkill -f Xvfb `ps aux | grep Xvfb | grep -v grep |  awk '{print $2}'`
sleep 3
nohup Xvfb :10 -ac > /tmp/Xvfb.log 2>&1 &
echo "Xvfb started"
exit