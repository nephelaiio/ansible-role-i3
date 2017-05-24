FROM base/archlinux:latest
RUN pacman -Sy --noconfirm python python2 sudo ; ln -sf /usr/bin/python2 /usr/bin/python
RUN pacman -Sy --noconfirm sed gzip
RUN echo en_US.UTF-8 UTF-8 > /etc/locale.gen
RUN locale-gen