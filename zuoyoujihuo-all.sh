#!/bin/sh
rm -rf /data/local/tmp/.knife
mkdir /data/local/tmp/.knife
mkdir /data/local/tmp/.knife/dalvik-cache
chmod 777 /data/local/tmp/.knife
cat /storage/emulated/0/zuoyou/inject/sdk.dex.jar >/data/local/tmp/.knife/inject.jar
chmod 777 /data/local/tmp/.knife/inject.jar
chown shell /data/local/tmp/.knife/inject.jar
export CLASSPATH=/data/local/tmp/.knife/inject.jar
export ANDROID_DATA=/data/local/tmp/.knife
exec app_process /data/local/tmp/.knife com.coffee.injectmotionevent.main.InjectMotionEvent 0 200 300 &

rm -rf /data/data/com.zuoyou.center/files/knife_server
cat /storage/emulated/0/zuoyou/inject/knife_server >/data/data/com.zuoyou.center/files/knife_server
chown root /data/data/com.zuoyou.center/files/knife_server
chmod 777 /data/data/com.zuoyou.center/files/knife_server
/data/data/com.zuoyou.center/files/knife_server 3253 &

export LD_LIBRARY_PATH=/vendor/lib:/system/lib

