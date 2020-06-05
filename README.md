# QCX Challenge

You will need [Docker](https://www.docker.com/) installed to run this project.

## How to run it:

1. First of all, build application and set up

`docker-compose up -d web`

2. Second, we need create the database

`docker-compose run --rm web rake db:create`

