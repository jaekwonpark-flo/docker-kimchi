FROM ubuntu:16.04

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

# Configure apt
RUN LC_ALL=C.UTF-8 
RUN apt-get -y update && C_ALL=C DEBIAN_FRONTEND=noninteractive apt-get -y install \
    python-configobj novnc python-libvirt \
    libvirt-bin nfs-common qemu-kvm python-parted \
    python-ethtool sosreport python-ipaddr \
    python-lxml open-iscsi python-guestfs \
    libguestfs-tools spice-html5 python-magic \
    python-paramiko python-imaging 


RUN curl -L "http://kimchi-project.github.io/wok/downloads/latest/wok.noarch.deb" -o /tmp/wok.noarch.deb; apt-get install -y /tmp/wok.noarch.deb
RUN curl -L "http://kimchi-project.github.io/kimchi/downloads/latest/kimchi.noarch.deb" -o /tmp/kimchi.noarch.deb; apt-get install -y /tmp/kimchi.noarch.deb

RUN apt-get clean && rm -r /var/lib/apt/lists/*

EXPOSE 8001
CMD ["/usr/bin/wokd --host=0.0.0.0"]
