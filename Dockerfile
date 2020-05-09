FROM debian:stable-slim
LABEL author="goldimage@mailbox.org"
LABEL io.whk.version="0.4.3"
LABEL io.whk.release-date="2020-05-08"
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends binutils=2.31.1-16 elfutils=0.176-1.1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* && \
    useradd -u 10001 mvs
COPY tk4 /tk4
RUN chgrp -R mvs /tk4 && chown -R mvs /tk4
USER mvs
WORKDIR /tk4
RUN mkdir -p log && echo "CONSOLE">/tk4/unattended/mode
ENTRYPOINT [ "./mvs" ]
EXPOSE 3270 8038