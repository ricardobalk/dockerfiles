# Mozilla Firefox, based on Alpine Linux 3.18.0.

> Docker image with Mozilla Firefox, based on Alpine Linux. The idea was to create a Docker image that can run Firefox on a Linux host, and have it display on the host's X server, so you can use Firefox in a container, for example to access websites that you don't trust. The image is based on Alpine Linux, so it's very small, and it's multi-architecture.

## Usage

### 1. Pull the image from Docker Hub, or build it.

**Docker Hub**

Pull the image directly from Docker Hub:

```sh
docker pull ghcr.io/ricardobalk/firefox
```

Assuming you cloned the repository from GitHub, you could also build the image yourself:

```sh
docker build -t ghcr.io/ricardobalk/firefox .
```

Or, if you want to build a multi-architecture image, you can use `buildx`:

```sh
docker buildx build --platform linux/arm64,linux/amd64,linux/amd64/v2,linux/386,linux/arm/v7 \
                    --label "org.opencontainers.image.description=Mozilla Firefox, based on Alpine Linux."  \
                    --label "org.opencontainers.image.source=https://github.com/ricardobalk/dockerfiles/tree/main/firefox" \
                    -t ghcr.io/ricardobalk/firefox \
                    -t ricardobalk/firefox \
                    --push \
                    .
```

### 2. Allow X server forwarding so Docker can show the GUI

On the Linux host, you need to allow X server forwarding, so Docker can show the GUI.

```sh
xhost +SI:localuser:$(id -un)
```

This will allow the current user to connect to the X server.

### 3. Run the created image in a container

```sh
docker run --rm --user="$(id -u):$(id -g)" -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -d ghcr.io/ricardobalk/firefox
```

- `--rm` will remove the container after each run, so you have a clean start each time.
- `--user="$(id -u):$(id -g)"` will run the container as the current user, so it can access the X server.
- `-v /tmp/.X11-unix:/tmp/.X11-unix` will link the X server between host and guest.
- `-e DISPLAY` will export the `$DISPLAY` environmental variable from host to guest.
- `-d` will run it in 'detached' mode, i.e. lets Firefox run on the background, so you can close the terminal window.

---

## Protip: Making it permanent

You could also use the image to create a Docker image that doesn't get destroyed each time you close Firefox.

### 1. Create a _named container_ based on the _image_

```sh
docker create --name 'firefox-personal' --user="$(id -u):$(id -g)" -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY ghcr.io/ricardobalk/firefox
```

### 2. Start the container

```sh
docker start firefox-personal
```

The difference between the `docker run` and `docker create` commands is that the former creates a new container each time, while the latter creates a container that can be started and stopped multiple times. The `docker start` command starts a container that was created with `docker create`. This allows you to keep your Firefox data, such as bookmarks, cookies, etc.