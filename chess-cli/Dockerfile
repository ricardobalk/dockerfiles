from debian:10-slim

RUN apt update && \
    apt install -y stockfish python3-pip && \
    pip3 install chs

RUN sed -i 's/stockfish_10_x64_linux/\/usr\/games\/stockfish/' '/usr/local/lib/python3.7/dist-packages/chs/engine/stockfish.py'

RUN rm -rf /var/lib/apt/lists/*

ENTRYPOINT ["/usr/local/bin/chs"]
CMD ["level=4"]
