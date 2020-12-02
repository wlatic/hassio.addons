ARG BUILD_FROM=hassioaddons/ubuntu-base:4.0.3
FROM $BUILD_FROM

# Set shell
SHELL ["/bin/bash", "-o", "pipefail", "-c"]

ARG BUILD_ARCH=amd64

RUN apt-get update && \
    apt-get install apt-utils --yes && \
    apt-get upgrade --yes && \
    DEBIAN_FRONTEND="noninteractive" apt-get --yes --option Dpkg::Options::="--force-confnew" --no-install-recommends install && \
    apt-get install libopencv-dev libtesseract-dev python3-pip git cmake build-essential libleptonica-dev --yes && \
    apt-get install liblog4cplus-dev libcurl3-dev python3-numpy --yes && \
    pip3 install Flask && \
    pip3 install requests

RUN cd /root && \
    git clone https://github.com/openalpr/openalpr.git && \
    cd openalpr/src && \
    mkdir build && \
    cd build && \
    cmake -DCMAKE_INSTALL_PREFIX:PATH=/usr -DCMAKE_INSTALL_SYSCONFDIR:PATH=/etc .. && \
    make && \
    make install && \
    cd /root/openalpr/src/bindings/python && \
    python3 setup.py install && \
    cd / && \
    rm -rf /root/openalpr/

RUN mkdir -p /root/oalpr/data && mkdir -p /root/oalpr/scripts && mkdir -p /root/oalpr/log

COPY ./oalpr.py /root/oalpr/scripts

COPY rootfs /

CMD python3 -u /config/oalpr/scripts/oalpr.py

# Build arguments
ARG BUILD_ARCH
ARG BUILD_DATE
ARG BUILD_REF
ARG BUILD_VERSION
