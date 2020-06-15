# QCX Challenge

You will need [Docker](https://www.docker.com/) installed to run this project.

## How to run it

### First of all, build application and set up

`docker-compose up -d web`

### Second, we need create the database and their respective tables

`docker-compose run --rm web rake db:create`
`docker-compose run --rm web rake db:migrate`

### Now, we need a github secret token

`docker-compose run --rm web rails github_secret`

Then, copy the token generated and configure your github repository webhook, pointing to `/webhook`

Now it is receiving events from github and storing the payload into database.

### Creating an user

To create an user, you must to run the following command:

`docker-compose run --rm web rails create_user\[email_address, password]`

For example:

`docker-compose run --rm web rails create_user\[email@example.com, 123456]`