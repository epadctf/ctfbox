FROM ubuntu:latest
MAINTAINER epadctf <epadctf@gmail.com>

ENV DEBIAN_FRONTEND noninteractive
ENV LANG C.UTF-8

RUN dpkg --add-architecture i386 \
    && apt-get update \
    && apt-get -yq install \
    build-essential \
    python2.7 \
    python2.7-dev \
    python-pip \
    git \
    tmux \
    gdb \
    gdb-multiarch \
    gdbserver \
    ltrace \
    strace \
    curl \
    wget \
    vim \
    qemu \
    qemu-user \
    qemu-user-static \
    ruby

# Python libs
RUN pip2 install --upgrade pip==9.0.3 \
    && pip2 install --upgrade pycrypto

# Pwntools
RUN pip install --upgrade git+https://github.com/Gallopsled/pwntools.git

# GEF
RUN wget -q -O- https://github.com/hugsy/gef/raw/master/scripts/gef.sh | sh

# Install ROPGadget
RUN git clone https://github.com/JonathanSalwan/ROPgadget /home/ctf/tools/ROPgadget \
    && cd /home/ctf/tools/ROPgadget \
    && python setup.py install

# Install one_gadget
RUN gem install one_gadget

# Clone EPAD dotfiles
RUN git clone https://github.com/epadctf/dotfiles.git /root/dotfiles \
    && mv /root/dotfiles/.vimrc /root/. \
    && mv /root/dotfiles/.bashrc /root/. \
    && rm -rf /root/dotfiles

WORKDIR /root/ctf
CMD ["/bin/bash", "-i"]
