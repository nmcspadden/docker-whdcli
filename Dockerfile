FROM ubuntu:latest

MAINTAINER nmcspadden@gmail.com

RUN apt-get install -y git
RUN apt-get install -y python-setuptools
RUN git clone git://github.com/kennethreitz/requests.git /home/requests
WORKDIR /home/requests
RUN python /home/requests/setup.py install
RUN git clone https://github.com/nmcspadden/WHD-CLI.git /home/whdcli
WORKDIR /home/whdcli
RUN python /home/whdcli/setup.py install
ADD com.github.nmcspadden.whd-cli.plist /whdcli/com.github.nmcspadden.whd-cli.plist
