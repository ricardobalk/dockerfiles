# chess-cli

With this Dockerfile, you can play chess right from your terminal.

## How to play

```sh
docker run --rm -it ricardobalk/chess-cli
```

By adding `level=`, you could tell the Stockfish Chess Engine to play against a certain difficulty level. Valid values are from 1 to 8.

```sh
docker run --rm -it ricardobalk/chess-cli level=6
```

## Local build

If you cloned the GitHub repository, you first need to build the Docker image...

```sh
docker build -t ricardobalk/chess-cli .
docker run --rm -it ricardobalk/chess-cli level=4
```
