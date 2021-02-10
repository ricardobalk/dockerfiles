# RTMP Multiplexer

This repository contains a basic RTMP Multiplexer within Docker. The image is based on Ubuntu 18.04.

 - Make sure you've installed Docker
 - Clone this repository to a place of choice
 - Edit the configuration files.
 - Build the image according to the Dockerfile with:
   `docker build -t nginx-rtmp-multiplexer .` (include the dot)
 - Run the image in a _Docker container_:

   ```sh
   docker run --rm \
           --mount type=bind,source="$(pwd)"/nginx.conf,target=/usr/local/nginx/conf/nginx.conf,readonly \
           --mount type=bind,source="$(pwd)"/webroot,target=/usr/local/nginx/html,readonly \
           -p 1935:1935 \
           -p 80:80 \
           -td nginx-rtmp-multiplexer
   ```

 - Open `http://localhost/` to view the configuration instructions.
