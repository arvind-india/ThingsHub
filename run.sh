echo "Running..." $(date +%F_%R) > /home/pi/server/thingshub/run.log
kill -9 $(lsof -i :80 | grep "total" | awk {'print $2'}) > /dev/null
cp /home/pi/server/thingshub/release.log /home/pi/server/thingshub/release_$(date +%F_%R).log
/usr/bin/node --nouse-idle-notification --expose-gc --max_inlined_source_size=1200 /home/pi/server/thingshub/release.js 80 > /home/pi/server/thingshub/release.log &
