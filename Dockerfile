FROM debian:jessie
MAINTAINER Ryar Nyah <ryarnyah@gmail.com>

ENV LC_ALL en_US.UTF-8
ENV PYTHONIOENCODING UTF-8

# Install GEF
RUN dpkg --add-architecture i386 && \
  apt-get update && \
  apt-get install sudo gdb gdbserver gdb-multiarch git make gcc g++ wget cmake pkg-config libc6:i386 libstdc++6:i386 binutils -y && \
  mkdir /src && \
  cd /src && \
  git clone https://github.com/pwndbg/pwndbg && cd pwndbg && ./setup.sh && \
  apt-get remove -y --purge git make gcc g++ wget cmake pkg-config && apt-get autoremove -y --purge && apt-get -y autoclean
