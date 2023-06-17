# Stockfish

> UCI chess engine, compiled from source. Statically linked with musl libc and optimized for size. Multi-platform image. Resulting image only contains the `stockfish` binary, no other unnecessary files. Can be run on a cluster of Raspberry Pi 4's, for example.

## Usage

```sh
docker run --rm -it ghcr.io/ricardobalk/stockfish:15.1
```

> Please note that Stockfish is a chess engine, not a chess GUI. You will need a chess GUI and connect it to the engine using the UCI protocol.
> If you want a Docker image with a CLI based Chess "GUI", check out [this image][chess-cli] I've built.

---

## Building the image yourself

Build for current platform only:

```sh
docker build -t stockfish:15.1 --build-arg TARGETPLATFORM=linux/amd64/v2 .
```
> Replace `TARGETPLATFORM` to let the build step match the correct CPU architecture that is in use. Take a look at the the [Dockerfile](./Dockerfile) if you have specific needs. The [Stockfish Makefile](https://github.com/official-stockfish/Stockfish/blob/master/src/Makefile) contains of supported CPU architectures.

Or build multi-architecture image using `buildx`:

```sh
docker buildx build --platform linux/amd64,linux/amd64/v2,linux/arm64,linux/ppc64le,linux/386,linux/arm/v7 \
                    --label "org.opencontainers.image.description=Stockfish, UCI chess engine, compiled from source. Statically linked with musl libc and optimized for size. Multi-platform image."  \
                    --label "org.opencontainers.image.source=https://github.com/ricardobalk/dockerfiles/tree/main/stockfish" \
                    -t ghcr.io/ricardobalk/stockfish:15.1 \
                    -t ghcr.io/ricardobalk/stockfish:latest \
                    -t ricardobalk/stockfish:15.1 \
                    -t ricardobalk/stockfish:latest \
                    --no-cache \
                    --progress plain \
                    --push \
                    .
```

> The `TARGETPLATFORM` argument is not needed when using `buildx` as it will be set automatically.