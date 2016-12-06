#!/sbin/sh


SLOT=$(for i in `cat /proc/cmdline`; do echo $i | grep slot | dd bs=1 skip=24 2>/dev/null; done)
BOOTPATH="/dev/block/bootdevice/by-name/boot$SLOT"
/tmp/busybox dd if=$BOOTPATH of=/tmp/boot.img

