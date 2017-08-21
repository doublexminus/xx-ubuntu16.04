FROM ubuntu:16.04
MAINTAINER DoubleXMinus <doublexminus@web.de>

ENV DEBIAN_FRONTEND noninteractive
ENV _clean="rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*"
ENV _apt_clean="eval apt-get clean && $_clean"

RUN apt-get update
RUN apt-get install -y tzdata language-pack-de
RUN ln -fs /usr/share/zoneinfo/Europe/Berlin /etc/localtime && dpkg-reconfigure -f noninteractive tzdata

# fix locale.
RUN locale-gen de_DE.UTF-8  
ENV LANG de_DE.UTF-8  
ENV LANGUAGE de_DE:de  
ENV LC_ALL de_DE.UTF-8
