#!/bin/sh
export CLASSPATH=/data/local/tmp/.knife/inject.jar
export ANDROID_DATA=/data/local/tmp/.knife
exec app_process /data/local/tmp/.knife com.coffee.injectmotionevent.main.InjectMotionEvent 0 200 300 &
export LD_LIBRARY_PATH=/vendor/lib:/system/lib

