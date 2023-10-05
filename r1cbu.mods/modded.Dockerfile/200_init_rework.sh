#!/bin/sh -e
# (C) 2023 Joerg Jungermann, GPLv2 see LICENSE

PS4='> ${0##*/}: '
#set -x

echo "I: rework init system, to have it more SysV"
  mkdir -p /target/etc/rc.d/disabled
  cd /target/etc/init.d
  for rcd in [KS][0-9][0-9]*; do
    initd="${rcd##???}"
    initd="${initd##-[0-9]-}"
    op="${rcd%${rcd#?}}"
    level="${rcd%${initd}}"
    level="${level#?}"
    mv "$rcd" "$initd"
    ln -s "../init.d/${initd}" "../rc.d/${rcd}"
  done
  sed -i -e 's|init.d|rc.d|' rcS rcK
