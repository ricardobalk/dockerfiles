# Mozilla Firefox, based on Alpine Linux.

This is a Mozilla Firefox setup in Docker. Here's how to use it:

## 1. Pull the image from Docker Hub, or build it.

**Docker Hub**

Pull the image directly from Docker Hub:

```sh
docker pull ricardobalk/firefox
```

**Or build it yourself**

Assuming you cloned the repository from GitHub, you could also build the image:

```sh
docker build -t ricardobalk/firefox .
```

## 2. Allow X server forwarding so Docker can show the GUI

```sh
xhost local:root
```

## 3. Run the created image in a container

```sh
docker run --rm -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY -d ricardobalk/firefox
```

- `--rm` will remove the container after each run, so you have a clean start each time.
- `-v /tmp/.X11-unix:/tmp/.X11-unix` will link the X server between host and guest.
- `-e DISPLAY` will export the `$DISPLAY` environmental variable from host to guest.
- `-d` will run it in 'detached' mode, i.e. lets Firefox run on the background, so you can close the terminal window.

---

# Protip: Making it permanent

You could also use the image to create a Docker image that doesn't get destroyed each time you close Firefox.

## 1. Create a _container_ based on the _image_:

```sh
docker create --name 'firefox-personal' -v /tmp/.X11-unix:/tmp/.X11-unix -e DISPLAY ricardobalk/firefox
```

## 2. Start the container

```sh
docker start firefox-personal
```

Now, changes made to Firefox are kept across restarts of this container. You could also choose a name different than `firefox-personal`, obviously.

---

# Removal

First, remove all containers that are using the image...

```sh
docker container rm firefox-personal
```

Then, remove the image...

```sh
docker image rm ricardobalk/firefox
```
