# Docker + Ioncube (Debian Linux)

[![N|Solid](https://digyfy.com/wp-content/uploads/2019/09/digyfy_blue_150x150.png)](https://digyfy.com)
Ioncube for Docker (Linux Debian):

  - Automatically installs Ioncube on docker compose up -d for your Debian Linux
  - Easy to change PHP Version for loading Ioncube ext.
  - Fast setup

## Instalation

```sh
$ cd projectPath
$ git clone https://github.com/Frenks/docker-ioncube.git .
$ nano Dockerfile # You can easily switch your PHP Version from php 7.3 to yours.
$ docker-compose build
$ docker-compose up -d
```

## How To Check if Ioncube was loaded?

```sh
$ cd dockerRoot
$ docker ps
$ docker exec -it <name> bash
$ php -v
```

If you will see something like this : 

```PHP 7.3.11 (cli) (built: Oct 25 2019 02:28:50) ( NTS )
Copyright (c) 1997-2018 The PHP Group
Zend Engine v3.3.11, Copyright (c) 1998-2018 Zend Technologies
    with the ionCube PHP Loader + ionCube24 v10.3.9, Copyright (c) 2002-2019, by ionCube Ltd.
```

You have succesfully installed Ioncube extension.

## Install only by adding the code to Dockerfile

```
ADD http://downloads3.ioncube.com/loader_downloads/ioncube_loaders_lin_x86-64.tar.gz /tmp/

RUN tar xvzf /tmp/ioncube_loaders_lin_x86-64.tar.gz -C /tmp/ \
    && cp /tmp/ioncube/ioncube_loader_* /usr/local/lib/php/extensions/no-debug-non-zts-20180731/ \
    && rm -rf /tmp/ioncube
COPY 00-ioncube.ini /usr/local/etc/php/conf.d/00-ioncube.ini

RUN service apache2 restart
```
+ Download : 00-ioncube.ini file and add it to the directory where your Dockerfile exists
