FROM ubuntu:14.04

RUN \
  DEBIAN_FRONTEND=noninteractive apt-get update && \
  DEBIAN_FRONTEND=noninteractive apt-get install -y build-essential git curl \
    cmake pkg-config libprotoc-dev libprotobuf8 protobuf-compiler \
    libprotobuf-dev libosmpbf-dev libpng12-dev libtbb-dev libbz2-dev \
    libstxxl-dev libstxxl-doc libstxxl1 libxml2-dev libzip-dev \
    libboost-all-dev lua5.1 liblua5.1-0-dev libluabind-dev libluajit-5.1-dev

RUN \
  git clone git://github.com/Project-OSRM/osrm-backend.git /src && \
  mkdir -p /build && \
  cd /build && \
  cmake /src && make && \
  mv /src/profiles/lib/ lib && \
  rm -rf /src

RUN mkdir -p /opt/osrm/etc /opt/osrm/bin

ADD sources/ /opt/osrm/bin/

VOLUME ["/opt/osrm/data", "opt/osrm/etc", "opt/osrm/stxxl", "opt/osrm/profiles"]

EXPOSE 5000

ENTRYPOINT ["/opt/osrm/bin/boot"]

CMD ["/build/osrm-routed", "-c", "/opt/osrm/etc/osrm.conf", "/opt/osrm/data/map.osrm"]