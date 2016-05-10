FROM debian:jessie

MAINTAINER schmorrison

WORKDIR  /root/

RUN apt-get update && \
	apt-get -y install wget unzip less && \
	apt-get clean && \
	rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN wget http://downloads.rclone.org/rclone-current-linux-amd64.zip && \
	  unzip rclone-current-linux-amd64.zip && \
	  rm rclone-current-linux-amd64.zip && \
	  mv rclone-*/rclone /usr/bin/ && \
	  rm -rf rclone-*