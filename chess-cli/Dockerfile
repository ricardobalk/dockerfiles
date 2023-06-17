FROM alpine:3.18.0 as sf-dependencies
RUN apk add --no-cache git make llvm clang libc-dev

FROM sf-dependencies as sf-source
WORKDIR /stockfish
RUN git clone --depth=1 https://github.com/official-stockfish/Stockfish.git . && \
    git fetch --tags --prune && \
    git checkout sf_15.1

FROM sf-source as sf-build
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
    && make build ARCH="${ARCH}" COMP="clang" \
    && strip stockfish

FROM alpine:3.18.0 as chs-build
RUN apk add --no-cache python3 py3-pip
RUN python3 -m pip install chs
RUN sed -i 's/stockfish_10_x64_linux/\/usr\/local\/bin\/stockfish/' '/usr/lib/python3.11/site-packages/chs/engine/stockfish.py'

FROM alpine:3.18.0
RUN apk add --no-cache python3
COPY --from=sf-build /stockfish/src/stockfish /usr/local/bin/stockfish
COPY --from=chs-build /usr/lib/python3.11/site-packages/ /usr/lib/python3.11/site-packages/
COPY --from=chs-build /usr/bin/chs /usr/bin/chs
ENTRYPOINT [ "/usr/bin/chs"]
CMD ["--level=4"]