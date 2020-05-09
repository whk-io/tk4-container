FROM ubuntu:20.04 as base
LABEL author="goldimage@mailbox.org"
LABEL io.whk.version="0.4.3"
LABEL io.whk.release-date="2020-05-08"
RUN adduser --disabled-password --gecos "" mvs
COPY tk4 /tk4
RUN chgrp -R mvs /tk4 && chown -R mvs /tk4

FROM ubuntu:20.04
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends binutils=2.34-6ubuntu1 elfutils=0.176-1.1build1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
    
COPY --from=base /etc/passwd /etc/passwd
COPY --from=base /tk4 /tk4
USER mvs
WORKDIR /tk4
RUN mkdir -p log && echo "CONSOLE">/tk4/unattended/mode
ENTRYPOINT [ "./mvs" ]
EXPOSE 3270 8038