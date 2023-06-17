FROM alpine:3.18.0 as dependencies
RUN apk add --no-cache git make llvm clang libc-dev

FROM dependencies as source
WORKDIR /stockfish
RUN git clone --depth=1 https://github.com/official-stockfish/Stockfish.git . && \
    git fetch --tags --prune && \
    git checkout sf_15.1

FROM source as build
WORKDIR /stockfish/src
RUN sed -i '574s/^/#/' Makefile # Temporary fix for Clang 16, see https://github.com/official-stockfish/Stockfish/issues/4580

ARG TARGETPLATFORM
RUN case "${TARGETPLATFORM}" in \
    "linux/arm64")    export ARCH=armv8 \
    ;; \
    "linux/arm/v7")   export ARCH=armv7-neon \
    ;; \
    "linux/ppc64le")  export ARCH=ppc-64 \
    ;; \
    "linux/amd64")    export ARCH=x86-64 \
    ;; \
    "linux/amd64/v2") export ARCH=x86-64-modern \
    ;; \
    "linux/386")      export ARCH=x86-32-sse41-popcnt \
    ;; \
    *) echo "Unsupported architecture: ${TARGETPLATFORM}" && exit 1 \
    ;; \
    esac \
    && make build ARCH="${ARCH}" COMP="clang" CFLAGS="-static" CXXFLAGS="-static" \
    && strip stockfish

# FROM alpine:3.18.0
# # RUN apk add --no-cache libstdc++
# COPY --from=build /stockfish/src/stockfish /usr/local/bin/stockfish
# RUN addgroup -S stockfish && \
#     adduser -S stockfish -G stockfish && \
#     chown stockfish:stockfish /usr/local/bin/stockfish
# USER stockfish
# ENTRYPOINT ["/usr/local/bin/stockfish"]

# FROM busybox:1.36.1-musl
# COPY --from=build /stockfish/src/stockfish /bin/stockfish
# RUN addgroup -S stockfish && \
#     adduser -S stockfish -G stockfish && \
#     chown stockfish:stockfish /bin/stockfish
# USER stockfish
# ENTRYPOINT ["/bin/stockfish"]

FROM scratch
COPY --from=build /stockfish/src/stockfish /stockfish
ENTRYPOINT ["/stockfish"]