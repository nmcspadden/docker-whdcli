FROM debian:latest

MAINTAINER nmcspadden@gmail.com

RUN apt-get update && apt-get install -y python-setuptools && apt-get clean
RUN rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ADD https://github.com/kennethreitz/requests/tarball/master /home/requests/master.tar.gz
RUN tar -zxvf /home/requests/master.tar.gz --strip-components=1 -C /home/requests && rm -f /home/requests/master.tar.gz
WORKDIR /home/requests
RUN python /home/requests/setup.py install
ADD https://github.com/nmcspadden/WHD-CLI/tarball/master /home/whdcli/master.tar.gz
RUN tar -zxvf /home/whdcli/master.tar.gz --strip-components=1 -C /home/whdcli && rm /home/whdcli/master.tar.gz
WORKDIR /home/whdcli
RUN python /home/whdcli/setup.py install