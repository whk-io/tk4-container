FROM ubuntu:20.04
LABEL author="goldimage@mailbox.org"
LABEL io.whk.version="0.4.12"
LABEL io.whk.release-date="2020-05-08"
RUN apt-get update -y && \
    apt-get install -y --no-install-recommends binutils=2.34-6ubuntu1 elfutils=0.176-1.1build1 && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
COPY tk4 /tk4
WORKDIR /tk4
RUN mkdir -p /tk4/log && echo "CONSOLE">/tk4/unattended/mode
ENTRYPOINT [ "./mvs" ]
EXPOSE 3270 8038
