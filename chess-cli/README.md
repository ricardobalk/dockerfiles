# chess-cli

> CLI based Chess "GUI" with Stockfish 15.1 Chess Engine. Multi-platform image.

## Usage

```sh
docker run --rm -it ghcr.io/ricardobalk/chess-cli level=4
```

> Use mathematical notation to move pieces. For example, `e2e4` to move the pawn from `e2` to `e4`.
> By adding `level=`, you could tell the Stockfish Chess Engine to play against a certain difficulty level. Valid values are from 1 to 8.

## Building the image yourself

Current platform only:

```sh
docker build -t ghcr.io/ricardobalk/chess-cli:1.0.0 \
             -t ghcr.io/ricardobalk/chess-cli:latest \
             -t ricardobalk/chess-cli:1.0.0 \
             -t ricardobalk/chess-cli:latest \
             --build-arg TARGETPLATFORM=x86-64-modern \
             --no-cache \
             .
```

> Replace `ARCH` with the architecture you want to build for. Check the [Stockfish Makefile](https://github.com/official-stockfish/Stockfish/blob/master/src/Makefile) for a list of supported architectures.

Or build multi-architecture image using `buildx`:

```sh
docker buildx build --platform linux/amd64,linux/amd64/v2,linux/arm64 \
                    --label "org.opencontainers.image.description=chess-cli, CLI based Chess GUI with Stockfish 15.1 Chess Engine" \
                    --label "org.opencontainers.image.source=https://github.com/ricardobalk/dockerfiles/tree/main/chess-cli" \
                    -t ghcr.io/ricardobalk/chess-cli:1.0.0 \
                    -t ghcr.io/ricardobalk/chess-cli:latest \
                    -t ricardobalk/chess-cli:1.0.0 \
                    -t ricardobalk/chess-cli:latest \
                    --no-cache \
                    --push \
                    .
```