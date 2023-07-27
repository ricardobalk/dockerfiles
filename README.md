# ricardobalk/dockerfiles

This repository contains my Dockerfiles used for the images on [Docker Hub][] and [GitHub Container Registry][].

## List of available images

| Name | Description | Links | Version | Source-based? | Platforms |
| ---- | ----------- | ----- | ------- | ------------- | --------- |
| [chess-cli][chess-cli-github] | Chess CLI using Stockfish 15 | [Repository][chess-cli-github] / [Docker Hub][chess-cli-dockerhub] / [GitHub Container Registry][chess-cli-ghcr] | 1.0.0 | Yes &#x2705; | linux/amd64 linux/amd64/v2 linux/arm64 linux/arm/v7 |
| [firefox][firefox-github] | Firefox web browser | [Repository][firefox-github] / [Docker Hub][firefox-dockerhub] / [GitHub Container Registry][firefox-ghcr] | ? | No &#x274C; |  linux/arm64 linux/amd64 linux/amd64/v2 linux/386 linux/arm/v7 |
| [mkp224o][mkp224o-github] | vanity address generator for tor onion v3 (ed25519) hidden services | [Repository][mkp224o-github] / [Docker Hub][mkp224o-dockerhub] / [GitHub Container Registry][mkp224o-ghcr] | 1.6.1 | Yes &#x2705; | linux/arm64 linux/amd64 linux/amd64/v2 linux/ppc64le linux/s390x linux/386 linux/arm/v7 linux/arm/v6 |
| [stockfish][stockfish-github] | UCI chess engine | [Repository][stockfish-github] / [Docker Hub][stockfish-dockerhub] / [GitHub Container Registry][stockfish-ghcr] | 16 | Yes &#x2705; | linux/amd64 linux/amd64/v2 linux/arm64 linux/ppc64le linux/386 linux/arm/v7 |

[Docker Hub]: https://hub.docker.com/u/ricardobalk
[GitHub Container Registry]: https://ghcr.io/ricardobalk

[chess-cli-github]: https://github.com/ricardobalk/docker/tree/main/chess-cli "GitHub repository for the chess-cli image"
[chess-cli-dockerhub]: https://hub.docker.com/r/ricardobalk/chess-cli "Docker Hub repository for the chess-cli image"
[chess-cli-ghcr]: https://ghcr.io/ricardobalk/chess-cli "GitHub Container Registry repository for the chess-cli image"

[firefox-github]: https://github.com/ricardobalk/docker/tree/main/firefox "GitHub repository for the firefox image"
[firefox-dockerhub]: https://hub.docker.com/r/ricardobalk/firefox "Docker Hub repository for the firefox image"
[firefox-ghcr]: https://ghcr.io/ricardobalk/firefox "GitHub Container Registry repository for the firefox image"

[mkp224o-github]: https://github.com/ricardobalk/docker/tree/main/mkp224o "GitHub repository for the mkp224o image"
[mkp224o-dockerhub]: https://hub.docker.com/r/ricardobalk/mkp224o "Docker Hub repository for the mkp224o image"
[mkp224o-ghcr]: https://ghcr.io/ricardobalk/mkp224o "GitHub Container Registry repository for the mkp224o image"

[stockfish-github]: https://github.com/ricardobalk/docker/tree/main/stockfish "GitHub repository for the stockfish image"
[stockfish-dockerhub]: https://hub.docker.com/r/ricardobalk/stockfish "Docker Hub repository for the stockfish image"
[stockfish-ghcr]: https://ghcr.io/ricardobalk/stockfish "GitHub Container Registry repository for the stockfish image"