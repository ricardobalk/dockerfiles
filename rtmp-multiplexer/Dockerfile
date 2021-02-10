FROM ubuntu:18.04

MAINTAINER Lighthouse Lab <lighthouselab@github.com>

RUN apt update \
    && apt install -y build-essential libpcre3 libpcre3-dev libssl-dev zlib1g-dev git mercurial

WORKDIR /rtmp-multiplexer

RUN hg clone http://hg.nginx.org/nginx \
    && git clone --depth 5 https://github.com/LighthouseLab/nginx-rtmp-module

RUN cd nginx \
    && ./auto/configure --with-http_ssl_module --add-module='../nginx-rtmp-module' \
    && make && make install

ENTRYPOINT ["/usr/local/nginx/sbin/nginx", "-g", "daemon off;"]
