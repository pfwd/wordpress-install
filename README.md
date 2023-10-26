# WordPress install using Docker and Composer


## Requirements

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


### Environmental Variables
Copy `.env.dist` to `.env` and adjust as required

```bash
$ cp .env.dist .env
```

### Docker Compose
Run containers
```
$ docker compose up -d
```