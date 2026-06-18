# (C) 2023 Joerg Jungermann, GPLv2 see LICENSE

FROM x6100:xiegu-vanilla AS xiegu
FROM x6100:r1cbu-vanilla AS r1cbu

FROM x6100:multiboot

  COPY --from=xiegu /target /target/Xiegu
  COPY --from=r1cbu /target /target/R1CBU

  RUN set -e ;\
    : set -x ;\
    cd /target ;\
    ln -s Xiegu Default ;\
    ln -s R1CBU Button1 ;\
    ln -s Xiegu Button2 ;\
    ln -s Xiegu Button3 ;\
    ln -s Xiegu Button4 ;\
    ln -s Xiegu Button5 ;\
  : # eo RUN

# vim: foldmethod=indent
