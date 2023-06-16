FROM alpine:3.17.1 AS builder
RUN apk add --no-cache \
    autoconf \
    ca-certificates \
    gcc \
    git \
    libc-dev \
    libsodium-dev \
    libsodium-static \
    make

USER nobody
WORKDIR /home/nobody
RUN git clone https://github.com/cathugger/mkp224o.git && \
    cd mkp224o && \
    git checkout v1.6.1 && \
    ./autogen.sh && \
    ./configure LDFLAGS="-static" && \
    # -static avoids the need for libsodium at runtime
    make && \
    strip mkp224o

# FROM alpine:3.12 AS mkp224o-alpine3.12
# # RUN apk add --no-cache libsodium
# COPY --from=builder /home/nobody/mkp224o/mkp224o /usr/local/bin/mkp224o
# ENTRYPOINT ["/usr/local/bin/mkp224o"]

FROM scratch AS mkp224o-binary
COPY --from=builder /home/nobody/mkp224o/mkp224o /mkp224o
ENTRYPOINT ["/mkp224o"]