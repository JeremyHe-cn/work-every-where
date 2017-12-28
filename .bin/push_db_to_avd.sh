#!/bin/bash
debug=true
pkg=com.maimairen.app.jinchuhuo.dev
if [ $1 ]; then
	pkg=$1
fi
avdDbDir=`pwd | sed "s/.*\/databases/\/data\/data\/$pkg\/databases/g"`
if [ debug ]; then
	echo packname: $pkg;
	echo target dir: $avdDbDir;
fi

dbFileName=jinchuhuobook.bdb
adb shell rm $avdDbDir/$dbFileName
adb  push ./$dbFileName $avdDbDir/$dbFileName

owner=`adb  shell ls -l $avdDbDir/sync | awk '{print $2}'`
adb  shell chown $owner:$owner $avdDbDir/$dbFileName
adb  shell chmod 600 $avdDbDir/$dbFileName

echo "result:"
adb  shell ls -l $avdDbDir


