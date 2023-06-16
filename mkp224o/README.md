# mkp224o

> mkp224o is a vanity address generator for tor onion v3 (ed25519) hidden services, it allows you to create custom v3 onion addresses (for example: `adameve(...d.onion`).

## Usage

Run the image inside a container:

```sh
docker run --name mkp224o_container_bob ghcr.io/ricardobalk/mkp224o -B bob -d /bob
```

Copy the generated keys from the container to the host:

```sh
docker cp mkp224o_container_bob:/bob .
```

Remove the container:

```sh
docker rm mkp224o_container_bob
```

---

## Building the image yourself

Current platform only:

```sh
docker build -t ghcr.io/ricardobalk/mkp224o:1.6.1 .
```

Or build multi-architecture image using `buildx`:

```sh
docker buildx build --platform linux/arm64,linux/amd64,linux/amd64/v2,linux/ppc64le,linux/s390x,linux/386,linux/arm/v7,linux/arm/v6 \
                    --label "org.opencontainers.image.description=mkp224o, vanity address generator for tor onion v3 (ed25519) hidden services"  \
                    --label "org.opencontainers.image.source=https://github.com/ricardobalk/dockerfiles/tree/main/mkp224o" \
                    -t ghcr.io/ricardobalk/mkp224o:1.6.1 \
                    -t ghcr.io/ricardobalk/mkp224o:latest \
                    -t ricardobalk/mkp224o:1.6.1 \
                    -t ricardobalk/mkp224o:latest \
                    --push \
                    .
```

[mkp224o]: https://github.com/ricardobalk/docker/tree/main/mkp224o