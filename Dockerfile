	FROM ubuntu:14.04
RUN apt-get update
RUN apt-get install build-essential nano autoconf libtool pkg-config libboost-all-dev libssl-dev libprotobuf-dev protobuf-compiler libevent-dev libqt4-dev libcanberra-gtk-module libdb-dev libdb++-dev bsdmainutils -y
WORKDIR /src/bitcoin
COPY ./bitcoin .
RUN chmod +x ./autogen.sh
RUN chmod +x /src/bitcoin/share/genbuild.sh
RUN chmod +x /src/bitcoin/src/leveldb/build_detect_platform
RUN ./autogen.sh
RUN ./configure --with-incompatible-bdb
RUN make -j60
RUN make install
RUN mkdir -p /root/bitcoind-simnet/libs
