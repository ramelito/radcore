#!/bin/bash

workdir=/opt
rulespath=/etc/udev/rules.d

mkdir -p $workdir/{bin,etc}
mkdir -p $workdir/var/log

sw_list="radcore usb_port_no.sh"

for file in $sw_list; do
	if test -f $file; then
		cp -v $file $workdir/bin
	fi
done

if test -f radcore.yml; then
	cp -v radcore.yml $workdir/etc/radcore.yml.example
	cp -v darkice.conf.j2 $workdir/etc/
	cp -v asound.conf.j2 $workdir/etc/
fi

#cp -v initrec /etc/init.d/
#insserv initrec

test -f 99-usb-serial.rules && cp 99-usb-serial.rules $rulespath/
test -f 99-usb-sound.rules && cp 99-usb-sound.rules $rulespath/
test -f 99-usb-storage-mgmt.rules && cp 99-usb-storage-mgmt.rules $rulespath/
