#!/bin/bash

echo "checking files"
if [ -f "rc-local.service" ]
then
    echo "found rc-local.service"
else
    echo "rc-local.service not found, exiting"
    exit -1
fi

if [ -f "rc.local" ]
then
    echo "found rc.local"
else
    echo "rc.local not found, exiting"
    exit -1
fi

if [ -f ".AUTORUN" ]
then
    echo "found .AUTORUN"
else
    echo "AUTO.RUN not found, exiting"
    exit -1
fi

echo "deleting old files"
if [ -f "/etc/systemd/system/rc-local.service" ]
then
    echo "found old rc-local service, deleting"
    rm /etc/systemd/system/rc-local.service
fi

if [ -d "/AUTO.RUN" ]
then
    echo "found old /AUTO.RUN, deleting"
    rm /AUTO.RUN -r
fi

echo "installing AUTO RUN"
echo "copying files"
cp rc.local /etc/rc.local
cp rc-local.service /etc/systemd/system/rc-local.service
mkdir /AUTO.RUN
cp .AUTORUN /AUTO.RUN/.AUTORUN
cp *.enable.sh /AUTO.RUN/

echo "activating rc-local service"
systemctl enable rc-local.service
