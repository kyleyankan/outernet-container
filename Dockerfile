FROM ubuntu:16.04

#Set up out workspace
USER root

RUN mkdir /outernetsoftware
RUN mkdir /outernetcase
RUN mkdir /outernetdownload

WORKDIR /outernetsoftware

#Download Outernet Project
RUN apt-get update && apt-get install -y wget sudo udev usbutils kmod
RUN wget https://github.com/Outernet-Project/outernet-linux-lband/archive/master.tar.gz -O outernet.tar.gz && tar xvf outernet.tar.gz
RUN export USER=root
RUN cd outernet-linux-lband-master && sudo ./installer.sh quick
RUN demod-presets americas

ENTRYPOINT decoder
