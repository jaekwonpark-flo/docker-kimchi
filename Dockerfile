FROM debian:10
MAINTAINER Jaekwon Park <jaekwon.park@sk.com>

#RUN curl -L http://kimchi-project.github.io/ginger/downloads/latest/ginger.el7.centos.noarch.rpm -o /tmp/ginger.el7.centos.noarch.rpm; curl -L http://kimchi-project.github.io/wok/downloads/latest/wok.el7.centos.noarch.rpm -o /tmp/wok.el7.centos.noarch.rpm;curl -L http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.el7.centos.noarch.rpm -o /tmp/ginger-base.el7.centos.noarch.rpm; curl -L http://kimchi-project.github.io/kimchi/downloads/latest/kimchi.el7.centos.noarch.rpm -o /tmp/kimchi.el7.centos.noarch.rpm;curl -L https://dl.fedoraproject.org/pub/epel/epel-release-latest-7.noarch.rpm -o /tmp/epel-release-latest-7.noarch.rpm
RUN wget https://github.com/kimchi-project/wok/releases/download/3.0.0/wok-3.0.0-0.debian.noarch.deb \
    apt install -y ./wok-3.0.0-0.debian.noarch.deb \
    apt install -y python3-pip pkg-config libnl-route-3-dev \
    pip3 install -r https://raw.githubusercontent.com/kimchi-project/kimchi/master/requirements-UBUNTU.txt \
    wget https://github.com/kimchi-project/kimchi/releases/download/3.0.0/kimchi-3.0.0-0.noarch.deb \
    apt install -y ./kimchi-3.0.0-0.noarch.deb

EXPOSE 8001
CMD ["/usr/bin/wokd --host=0.0.0.0"]
