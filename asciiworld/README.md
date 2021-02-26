# asciiworld

Asciiworld is an application written in C that could show a live map of the world and the sun's position.

In this Dockerfile, it is used to render a nice PNG-file of it, so you could use it elsewhere, for example, as your desktop's background image. Pretty cool. And as it runs on your own computer, the image is generated locally.

# How to use it

You basically pull this Docker image straight from Docker Hub, or clone the [GitHub repository][] to build the Docker image yourself...

## Obtaining the Docker image

**Option 1 &mdash; Pulling from Docker Hub**

```sh
docker pull ricardobalk/asciiworld
```

**Option 2 &mdash; Building it yourself**

Assuming that you've cloned the [GitHub repository][] and are now in the directory, go ahead with building the image...

```sh
docker build -t ricardobalk/asciiworld .
```

## Running the Docker image inside a container

This part is more diffult, as we're going to run asciiworld inside a container...

Step 1) Make a directory for the images.

```sh
asciiworlddir="$HOME/Pictures/asciiworld"
mkdir -p "$asciiworlddir"
```

Step 2) Run asciiworld

```sh
docker run --rm -v "$asciiworlddir":"/tmp/asciiworld/" asciiworld -w 1920 -h 1080 -s -m /asciiworld/ne_110m_land.shp -W /tmp/asciiworld/worldmap.png;
```

If you want to generate a new map every 15s on the background, you could put it in a while-loop.

```sh
while true;
 do
 docker run --rm -v "$asciiworlddir":"/tmp/asciiworld/" asciiworld -w 1920 -h 1080 -s -m /asciiworld/ne_110m_land.shp -W /tmp/asciiworld/worldmap.png;
 sleep 15s;
done &
disown
```

> Note: The `&` turns it into a background task, and the `disown` command lets you close your terminal window without killing the background task.

Step 3) Change the desktop background to the generated world map. On Ubuntu, one could use the following commands:

```sh
gsettings set org.gnome.desktop.background picture-uri "$asciiworlddir/worldmap.png"
gsettings set org.gnome.desktop.background picture-options 'scaled'
```

[GitHub repository]: https://github.com/ricardobalk/docker "Ricardo's Collection of Dockerfiles"
