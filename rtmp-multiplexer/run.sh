#!/bin/bash
docker run --rm \
           --mount type=bind,source="$(pwd)"/nginx.conf,target=/usr/local/nginx/conf/nginx.conf,readonly \
           --mount type=bind,source="$(pwd)"/webroot,target=/usr/local/nginx/html,readonly \
           -p 1935:1935 \
           -p 80:80 \
           -td nginx-rtmp-multiplexer
