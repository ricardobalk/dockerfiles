# murmur

With this you can run an instance of Murmur (Mumble server) in an easy way. The image I provided is based on Alpine Linux version 3.40.

---

## Getting started

Here is a basic guide for taking this image for a test drive:

**1) Pull Docker image from Docker Hub, or build it yourself**

```sh
docker pull ricardobalk/murmur
```

Or... If you cloned the GitHub repository, you could also build the Docker image yourself...

```sh
docker build -t ricardobalk/murmur .
```

**2) Run Docker image in a Docker container**

Let's run Murmur in a container on the background:

```sh
docker run --name murmur -p 64738:64738 -p 64738:64738/udp -td ricardobalk/murmur
```

**3) Stopping the instance**

As we have set the container's name to `murmur`, we can easily stop the running container:

```sh
docker container stop murmur
```

**4) Running it again**

```sh
docker container start murmur
```

**5) Getting rid of the container**

```sh
docker container rm murmur
```

**6) Getting rid of the image**

```sh
docker image rm ricardobalk/murmur
```


## Next steps

In order to use this Docker image in production environments, consider doing the following things:

- Change Murmur's configuration file.
- Add the configuration file via volume bind mounts or build it into your own image.
  e.g. `docker run [...] -v /some/local/path/to/murmur.ini:/etc/murmur.ini` for a volume bind mount
- Generate your own TLS certificates, especially if you're running the server publicly with its own domain name. You can use Let's Encrypt.
- Add the TLS certificates (volume bind mounts are recommended), and be sure that the configuration file includes them.
- Add some volumes so that Murmur could retain its database and logs across container restarts...
  - `/var/lib/murmur/`
  - `/var/log/murmur.log`
- Find some people to test it out with.
