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

owner=`adb  shell ls -l $avdDbDir/$dbFileName | awk '{print $2}'`

dbFileName=accountinfo.mdb
adb  push ./$dbFileName $avdDbDir/$dbFileName
adb  shell chown $owner:$owner $avdDbDir/$dbFileName
adb  shell chmod 777 $avdDbDir/$dbFileName

echo "result:"
adb  shell ls -l $avdDbDir


