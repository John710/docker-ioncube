FROM php:7.3-apache
MAINTAINER Frenks Simsons <devsimsons@gmail.com>

WORKDIR /var/www

RUN a2enmod headers
RUN a2enmod rewrite

RUN apt-get update

RUN apt-get -y --fix-missing install nano 

RUN usermod -u 1000 www-data

ADD http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /tmp/

RUN tar xvzf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /tmp/ \
    && cp /tmp/ioncube/ioncube_loader_* /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ \
    && rm -rf /tmp/ioncube
COPY 00-ioncube.ini /usr/local/etc/php/conf.d/00-ioncube.ini

RUN service apache2 restart
