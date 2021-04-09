FROM ubuntu:focal as scribus-base
RUN echo 'deb [trusted=yes] http://ppa.launchpad.net/scribus/ppa/ubuntu focal main' >> /etc/apt/sources.list.d/scribus.list && \
    echo 'deb-src [trusted=yes] http://ppa.launchpad.net/scribus/ppa/ubuntu focal main' >> /etc/apt/sources.list.d/scribus.list && \
    apt update && \
    apt install -y scribus xvfb && \
    rm -rf /var/lib/apt/lists/*

RUN useradd -ms /bin/bash scribus
USER scribus
WORKDIR /home/scribus
RUN mkdir -p /home/scribus/export
ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/xvfb-run -a /usr/bin/scribus $@", ""]
