# (C) 2023 Joerg Jungermann, GPLv2 see LICENSE

# set base, copy scripts & out-of-tree resources
FROM x6100:DL2ZW-COLOR_MOD-sdcard
COPY dl2zw-color_mod-vanilla.Dockerfile.d/ /src/dl2zw-color_mod-vanilla.Dockerfile.d/

#COPY DL2ZW-COLOR_MOD-patch.tar.gz /tmp

# set environment - all build containers inherit this
#ENV - none -
CMD rm -f /target/etc/resolv.conf; cp /etc/resolv.conf /target/etc/resolv.conf; exec env HOME=/root SHELL=/bin/bash chroot /target /bin/bash -l

# run scripts that do the modifications steps in one layer
# * moving files around - see # copy scripts & outoftree resources above
# * adding stuff, etc
RUN set -e ;\
  export \
    SRC=/src/dl2zw-color_mod-vanilla.Dockerfile.d/ ;\
  exec \
    /bin/sh /src/img-mangler/docker-build-helper.sh $SRC
