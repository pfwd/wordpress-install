# WordPress install using Docker and Composer


## Requirements

- Docker Machine
- Docker
- Docker Compose
- Composer
- Git

## Install

### Git clone

Clone the repo

```
git clone git@github.com:pfwd/wordpress-install.git wordpress-install
```

### Docker Machine

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
Create the wp-config file
```bash
$ docker-compose exec apache2 bash
$ ./vendor/bin/wp --allow-root config create --dbname=${MYSQL_DATABASE} --dbuser=root --dbpass=${MYSQL_ROOT_PASSWORD}  --dbhost=mysql
$ exit
```

### Enable SSL

- Copy /vhost_ssl.conf.dist to /vhost_ssl.conf
- Un comment line 11 in Dockerfile
- Add required cert files

## Uninstall

### Remove Docker Machine 

This will remove the Docker machine, delete any Docker images and containers
```
$ docker-machine rm -f wordpress-install
```