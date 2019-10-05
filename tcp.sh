#!/bin/bash
path1=/sdcard/zuoyou/inject/sdk.dex.jar
path2=/sdcard/zuoyou/inject/knife_server

javDir=/data/local/tmp/.knife
inject=/data/local/tmp/.knife/inject.jar
knife_server=/data/local/tmp/knife_server

# some os cannot execute $path directly
if [ ! -f $path1 ]; then
	    echo "ERROR: no found java inject file! " >&2
    exit 1
fi

if [ ! -f $path2 ]; then
	    echo "ERROR: no found so inject file!" >&2
    exit 1
fi

mkdir -p $javDir
chmod 0777 $javDir

if [ -f $inject ]; then
	rm -rf $inject
fi

if [ -f $inject ]; then
	echo "WARNING: /data/local/tmp is not writable" >&2
else
	cp $path1 $inject
	if [ -f $inject ]; then
		chmod 0777 $inject
	else
		echo "WARNING: /data/local/tmp is not writable" >&2
	fi
fi

if [ -f $knife_server ]; then
	rm -rf $knife_server
fi

if [ -f $knife_server ]; then
	echo "WARNING: /data/local/tmp is not writable" >&2
else
	cp $path2 $knife_server
	if [ -f $knife_server ]; then
		chmod 0777 $knife_server
	else
		echo "WARNING: /data/local/tmp is not writable" >&2
	fi
fi

kill -9 $(pidof com.zuoyou.inject)
kill -9 $(pidof knife_server)

if [ -x $inject ]; then
	export CLASSPATH=$inject
    exec app_process $javDir com.coffee.injectmotionevent.main.InjectMotionEvent 0 200 300 &
else
    echo "cannot execute inject" >&2
    exit 1
fi

if [ -x $knife_server ]; then
    exec $knife_server &
else
    echo "cannot execute knife_server" >&2
    exit 1
fi





