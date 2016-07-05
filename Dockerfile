##docker run --name rclone -it --rm -v $PWD/.rclone.conf:/root/.rclone.conf schmorrison/rclone_dockerfile sh -c "rclone -v copy /source/ [remote]:/dest/"

FROM alpine:3.3

MAINTAINER schmorrison<schmorrison@gmail.com>

WORKDIR  /root/

RUN apk add --update \
	wget \
	unzip \
	less

RUN wget http://pub.rclone.org/v1.29-33-g085677d%CE%B2/rclone-v1.29-33-g085677d%CE%B2-linux-amd64.zip \
	&& unzip rclone*.zip \
	&& mv  rclone-v1.29-33-g085677d?-linux-amd64/rclone /usr/bin/ \
	&& ls /usr/bin \
	&& rm -rf rclone-*

ENTRYPOINT ["/usr/bin/rclone"]