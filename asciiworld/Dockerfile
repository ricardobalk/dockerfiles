from debian:10 AS debian-with-shapelib
maintainer ricardobalk@github

# Update apt lists and install pkgs
RUN apt update && apt install -y autoconf build-essential git g++ libtool-bin libgd-dev

RUN mkdir -p shapelib
WORKDIR shapelib
RUN git clone https://github.com/OSGeo/shapelib.git .
RUN ./autogen.sh && make && make install


# Build asciiworld
from debian-with-shapelib AS asciiworld

WORKDIR /
RUN mkdir -p asciiworld
WORKDIR asciiworld
RUN apt install -y libshp-dev
RUN git clone https://www.uninformativ.de/git/asciiworld.git .
RUN make

# Cleanup
WORKDIR /
RUN apt remove --purge --yes autoconf build-essential g++ git libtool-bin libgd-dev
RUN rm -rf /var/cache/apt/archives
RUN rm -rf shapelib/

# Entrypoint and arguments
ENTRYPOINT ["/asciiworld/asciiworld"]
CMD ["-so"]
