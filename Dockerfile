FROM centos:7

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

# Configure apt
RUN LC_ALL=C.UTF-8 
RUN yum -y update 

RUN curl -L http://kimchi-project.github.io/ginger/downloads/latest/ginger.el7.centos.noarch.rpm -o /tmp/ginger.el7.centos.noarch.rpm; curl -L http://kimchi-project.github.io/wok/downloads/latest/wok.el7.centos.noarch.rpm -o /tmp/wok.el7.centos.noarch.rpm;curl -L http://kimchi-project.github.io/gingerbase/downloads/latest/ginger-base.el7.centos.noarch.rpm -o /tmp/ginger-base.el7.centos.noarch.rpm; curl -L http://kimchi-project.github.io/kimchi/downloads/latest/kimchi.el7.centos.noarch.rpm -o /tmp/kimchi.el7.centos.noarch.rpm

RUN yum -y install /tmp/ginger.el7.centos.noarch.rpm /tmp/wok.el7.centos.noarch.rpm /tmp/ginger-base.el7.centos.noarch.rpm /tmp/kimchi.el7.centos.noarch.rpm

EXPOSE 8001
CMD ["/usr/bin/wokd --host=0.0.0.0"]
