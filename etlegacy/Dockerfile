from debian:10 as base
RUN apt update && apt install -y curl
RUN useradd -md /home/etl -s /bin/bash wolfet
USER wolfet
WORKDIR /home/etl
RUN curl -o etlegacy.tar.gz https://www.etlegacy.com/download/file/254
RUN mkdir -p bin
WORKDIR /home/etl/bin
RUN tar xvf ../etlegacy.tar.gz -C ./ --strip-components=1 && rm ../etlegacy.tar.gz
COPY --chown=wolfet /data/default/*.pk3 /home/etl/bin/etmain/
COPY --chown=wolfet /data/config/*.cfg /home/etl/bin/etmain/
ENTRYPOINT ["/home/etl/bin/etlded"]
CMD ["+set", "g_protect 1", "+set", "omnibot_enable 1", "+set", "omnibot_path", "./legacy/omni-bot", "+exec", "etl_server.cfg"]
from base as extra
COPY --chown=wolfet /data/extra-maps/*.pk3 /home/etl/bin/etmain/
