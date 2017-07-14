FROM ubuntu:16.04

MAINTAINER Jaekwon Park <jaekwon.park@code-post.com>

# Configure apt
RUN LC_ALL=C.UTF-8 
RUN apt-get -y update && C_ALL=C DEBIAN_FRONTEND=noninteractive apt-get -y install \
    gcc make autoconf automake gettext git pkgconf xsltpro \
    python-configobj novnc python-libvirt \
    libvirt-bin nfs-common qemu-kvm python-parted \
    python-ethtool sosreport python-ipaddr \
    python-lxml open-iscsi python-guestfs \
    libguestfs-tools spice-html5 python-magic \
    python-paramiko python-imaging \
    apt-get clean && \
    rm -r /var/lib/apt/lists/*

RUN ./autogen.sh --system ; make; make install

# Configure apache module
RUN chown -R www-data:www-data /var/www/html/
RUN a2dismod mpm_event && \
    a2enmod mpm_prefork cgid access_compat rewrite && \
    ln -sf /dev/stdout /var/log/apache2/access.log && \
    ln -sf /dev/stderr /var/log/apache2/error.log

COPY foswiki.conf /etc/apache2/sites-available/

RUN a2ensite foswiki.conf && \
    a2dissite 000-default.conf

COPY apache2-foreground /usr/local/bin/

EXPOSE 80
WORKDIR /var/www/html

CMD ["apache2-foreground"]
