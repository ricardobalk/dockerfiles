FROM alpine:3.17.1 AS builder
RUN apk add --no-cache \
    autoconf \
    ca-certificates \
    gcc \
    git \
    libc-dev \
    libsodium-dev \
    make

USER nobody
WORKDIR /home/nobody
RUN git clone https://github.com/cathugger/mkp224o.git && \
    cd mkp224o && \
    git checkout v1.6.1 && \
    ./autogen.sh && \
    ./configure && \
    make && \
    strip mkp224o

FROM alpine:3.12 AS runner
RUN apk add --no-cache \
    libsodium
COPY --from=builder /home/nobody/mkp224o/mkp224o /usr/local/bin/mkp224o
ENTRYPOINT ["/usr/local/bin/mkp224o"]

# docker build -t mkp224o . && docker run --rm mkp224o -B bob