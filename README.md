# WordPress install using Docker and Composer


## Requirements

- Docker Machine (Optional)
- Docker
- Docker Compose
- Composer

## Install

### Docker Machine (Optional)

Create and set the docker machine to the current shell

```
$ docker-machine create wordpress-install
$ docker-machine env wordpress-install
$ eval $(docker-machine env wordpress-install)
```
### Composer

Install the required packages
```
$ composer install
```
### Docker Compose
Run containers
```
$ docker-compose up -d
```
## Uninstall

### Remove Docker Machine (Optional)

This will remove the Docker machine, delete any Docker images and containers
```
$ docker-machine rm -f wordpress-install
```

### Remove containers
```
$ docker rm -f wordpressinstallgit_apache2_1  wordpressinstallgit_mysql_1
```

### Remove images
```
$ docker image rm wordpressinstallgit_apache2  wordpressinstallgit_mysql mysql debian:stretch
```