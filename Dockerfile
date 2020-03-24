From ubuntu:16.04

MAINTAINER Jaemin Kim <mikjm98@kaist.ac.kr>

WORKDIR /

RUN apt-get update && \
  apt-get install -y software-properties-common \
  && rm -rf /var/lib/apt/lists/* \
  && add-apt-repository ppa:ubuntu-toolchain-r/test \
  && apt-get update \
  && apt-get install -y wget gcc-7 g++-7 gcc-5 gdb make \
  libncursesw5 libncurses5-dev libexpat1-dev xorg-dev libglib2.0-dev \
  && update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-7 20 \
  && update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-7 20

RUN apt-get install -y qemu-system-x86

WORKDIR /pintos-kaist

VOLUME [/pintos-kaist]
