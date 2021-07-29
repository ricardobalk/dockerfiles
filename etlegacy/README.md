# ET: Legacy Server

## Build

Basic version:

```sh
docker build --target base -t etl:base .
```

Extra maps:

```sh
docker build --target extra -t etl:extra .
```

## Running

```sh
docker run --rm -p 27960:27960 -p 27960:27960/udp -it etl:base
```

```sh
docker run --rm -p 27960:27960 -p 27960:27960/udp -it etl:extra
```

