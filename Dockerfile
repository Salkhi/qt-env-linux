FROM debian:latest

RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install libc-dev
RUN apt-get -y install \
    autoconf \
    automake \
    autopoint \
    bash \
    bison \
    bzip2 \
    flex \
    g++ \
    g++-multilib \
    gettext \
    git \
    gperf \
    intltool \
    libc6-dev-i386 \
    libgdk-pixbuf2.0-dev \
    libltdl-dev \
    libssl-dev \
    libtool-bin \
    libxml-parser-perl \
    make \
    openssl \
    p7zip-full \
    patch \
    perl \
    pkg-config \
    python \
    ruby \
    sed \
    unzip \
    wget \
    xz-utils
RUN apt-get -y install git
#RUN apt-get -y install gtk+2.0
RUN git clone https://github.com/mxe/mxe.git
RUN wget https://gitlab.com/4144/mxe/raw/master/src/qtwebengine.mk?inline=false -O ./mxe/src/qtwebengine.mk
RUN cd mxe && make update-checksum-qtwebengine
RUN cd mxe && make qt5
RUN cd mxe && make qtwebengine