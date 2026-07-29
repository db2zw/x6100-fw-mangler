# (C) 2023 Joerg Jungermann, GPLv2 see LICENSE

# set base, copy scripts & out-of-tree resources
FROM x6100:k4vz-r1cbu-opt-alpine
COPY       k4vz-r1cbu-modded.Dockerfile.d/ /src/k4vz-r1cbu-modded.Dockerfile.d/
# a bit of code reuse
COPY       xiegu-modded.Dockerfile.d/  /src/xiegu-modded.Dockerfile.d/

# set environment - all build containers inherit this
#ENV - none -

# run scripts that do the modifications steps in one layer
# * moving files around - see # copy scripts & outoftree resources above
# * adding stuff, etc
RUN set -e ;\
  export \
    SRC=/src/k4vz-r1cbu-modded.Dockerfile.d/ ;\
  exec \
    /bin/sh /src/img-mangler/docker-build-helper.sh $SRC
