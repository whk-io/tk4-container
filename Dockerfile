FROM debian:stable-slim
RUN apt-get update -y && apt-get upgrade -y
ADD tk4 /tk4
WORKDIR /tk4
ENTRYPOINT [ "./mvs" ]