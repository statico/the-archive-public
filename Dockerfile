FROM ubuntu as base
RUN apt-get update && \
    apt-get install -y curl

FROM base as glulxe
RUN apt-get install -y build-essential unzip

WORKDIR /build/

RUN curl -L -q https://github.com/erkyrath/cheapglk/archive/master.zip >cheapglk.zip && \
    unzip cheapglk.zip && \
    mv cheapglk-master cheapglk && \
    cd cheapglk && \
    make -j8 && \
    cd /build

RUN curl -L -q https://github.com/erkyrath/glulxe/archive/master.zip >glulxe.zip && \
    unzip glulxe.zip && \
    mv glulxe-master glulxe && \
    cd glulxe && \
    make -j8 && \
    cd /build

FROM base as final
COPY --from=glulxe /build/glulxe/glulxe /usr/local/bin/dglulxe

WORKDIR /tmp/
RUN curl -q -O http://emshort.com/inform-app-archive/6M62/I7_6M62_Linux_all.tar.gz && \
    tar -zxf I7_6M62_Linux_all.tar.gz && \
    cd inform7-6M62 && \
    ./install-inform7.sh --prefix /usr/local && \
    cd /tmp && \
    rm -rf I7_6M62_Linux_all.tar.gz inform7-6M62

WORKDIR /root/

RUN mkdir -p /root/Library/Inform && \
    curl -q -L -O https://github.com/i7/archive/archive/master.tar.gz && \
    tar -zxf master.tar.gz && \
    mv archive-master /root/Library/Inform/Extensions && \
    rm -rf master.zip archive-master

COPY the-archive.inform /root/the-archive.inform
COPY build ./
RUN RELEASE=1 /root/build

COPY test /root/
COPY tests/ /root/tests/
CMD /root/test
