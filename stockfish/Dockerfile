FROM alpine:3.18.0 as dependencies
RUN apk add --no-cache git make llvm clang libc-dev

FROM dependencies as source
WORKDIR /stockfish
RUN git clone --depth=1 https://github.com/official-stockfish/Stockfish.git . && \
    git fetch --tags --prune && \
    git checkout sf_15.1

FROM source as build
WORKDIR /stockfish/src
ARG ARCH=amd64
RUN sed -i '574s/^/#/' Makefile # Temporary fix for Clang 16, see https://github.com/official-stockfish/Stockfish/issues/4580
RUN make build ARCH="${ARCH}" COMP=clang CFLAGS="-static" CXXFLAGS="-static"
RUN strip stockfish

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