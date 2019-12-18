FROM ubuntu:16.04
MAINTAINER "Tyson Lee Swetnam <tswetnam@cyverse.org>"
VOLUME ["/input", "/output"]

RUN apt-get update && apt-get install -y \
libtiff-dev libgeotiff-dev libgdal1-dev \
libboost-system-dev libboost-thread-dev libboost-filesystem-dev libboost-program-options-dev libboost-regex-dev libboost-iostreams-dev \
git cmake build-essential wget


RUN cd /opt \
    && git clone https://github.com/m-schuetz/LAStools.git \
    && cd LAStools/LASzip && mkdir build && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release .. \
    && make \
    && make install \
    && ldconfig

RUN cd /opt \
    && git clone -b develop https://github.com/potree/PotreeConverter.git \
    && cd PotreeConverter \
    && mkdir build \
    && cd build \
    && cmake -DCMAKE_BUILD_TYPE=Release -DLASZIP_INCLUDE_DIRS=/opt/LAStools/LASzip/dll/ -DLASZIP_LIBRARY=/usr/local/lib/liblaszip.so .. \
    && make \
    && make install \
    && cp -r /opt/PotreeConverter/PotreeConverter/resources /opt/PotreeConverter/build/resources

CMD /opt/PotreeConverter/build/PotreeConverter
