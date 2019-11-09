# WordPress install using Docker and Composer


## Requirements

- Docker Machine (Optional)
- Docker
- Docker Compose
- Composer
- Git

## Install

### Git clone

Clone the repo

```
git clone git@github.com:pfwd/wordpress-install.git wordpress-install.git
```

### Docker Machine (Optional)

Create and set the docker machine to the current shell

```
$ docker-machine create wordpress-install
$ docker-machine env wordpress-install
$ eval $(docker-machine env wordpress-install)
```

### Environmental Variables
Copy `.env.dist` to `.env` and adjust as required

```bash
$ cp .env.dist .env
```

### Docker Compose
Run containers
```
$ docker-compose up -d --build
```

### Composer

Install the required packages
```
$ docker-compose exec apache2 composer install
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

## MYSQL scripts
All SQL scripts are located in /sql of the mysql container
