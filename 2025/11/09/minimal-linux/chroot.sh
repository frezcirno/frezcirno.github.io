#!/bin/sh
set -ex

unshare --mount-proc --uts --ipc --net --pid --fork --user --map-root-user chroot ./rootfs /sbin/init
