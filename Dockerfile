FROM debian:stable-slim
RUN apt-get update -y && apt-get upgrade -y && apt-get install -y binutils elfutils
ADD tk4 /tk4
WORKDIR /tk4
RUN mkdir -p log
ENTRYPOINT [ "./mvs" ]