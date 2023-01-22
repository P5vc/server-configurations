FROM debian:stable-slim

RUN apt-get update
RUN apt-get upgrade -y
RUN apt-get install rsync -y

RUN mkdir -p /transfer/sources
RUN mkdir -p /transfer/destinations

COPY ./transfer-script.sh /transfer/transfer-script.sh

WORKDIR /transfer

CMD bash ./transfer-script.sh
