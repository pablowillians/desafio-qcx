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

`docker-compose run --rm web rails create_user\[email_address,password]`

For example:

`docker-compose run --rm web rails create_user\[email@example.com,123456]`

*Pay attention: Don't put blank spaces between email and password arguments*

### Signing into application

Do a post request for `/users/sign_in` with your credentials. For example:

```bash
curl -X POST -i -H 'Accept: application/json' -H 'Content-Type: application/json' --data '{"user": {"email":"email@example.com","password":"123456"}}' http://localhost:3000/login
```

Then, you will receive a response like:

```
HTTP/1.1 201 Created
X-Frame-Options: SAMEORIGIN
X-XSS-Protection: 1; mode=block
X-Content-Type-Options: nosniff
X-Download-Options: noopen
X-Permitted-Cross-Domain-Policies: none
Referrer-Policy: strict-origin-when-cross-origin
Location: /
Content-Type: application/json; charset=utf-8
Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1ZDBhMjI3NS0wM2Y4LTQxZjItYTdjNC1mNjJjM2M5NjliNGYiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE1OTIxOTI5MDcsImV4cCI6MTU5MjI3OTMwNywianRpIjoiMzYzMmRhM2QtYzljNC00MWExLThkNDMtZjMwODY2NDI0OGU5In0.utPCqls1vdCiULTlTSRmASoH2YeUAfKh_2xoGXjlL4k
ETag: W/"edc3eb557d58495975d6f7185f1c1ed3"
Cache-Control: max-age=0, private, must-revalidate
X-Request-Id: e2d6dfcb-8de7-4293-9664-0d96143396e4
X-Runtime: 0.313535
Transfer-Encoding: chunked

{"id":"5d0a2275-03f8-41f2-a7c4-f62c3c969b4f","email":"user@example.com","created_at":"2020-06-15T00:49:49.405Z","updated_at":"2020-06-15T00:49:49.405Z"}
```

### Retrieving issue events list

Do a get request for `/issues/{issue number}/events`. For example:

```bash
curl -H 'Accept: application/json' -H 'Content-Type: application/json' -H 'Authorization: Bearer eyJhbGciOiJIUzI1NiJ9.eyJzdWIiOiI1ZDBhMjI3NS0wM2Y4LTQxZjItYTdjNC1mNjJjM2M5NjliNGYiLCJzY3AiOiJ1c2VyIiwiYXVkIjpudWxsLCJpYXQiOjE1OTIxOTI5MDcsImV4cCI6MTU5MjI3OTMwNywianRpIjoiMzYzMmRhM2QtYzljNC00MWExLThkNDMtZjMwODY2NDI0OGU5In0.utPCqls1vdCiULTlTSRmASoH2YeUAfKh_2xoGXjlL4k' http://localhost:3000/issues/1/events
```

Then, you will receive a response like:

```
[{"id":"9d67a8f4-79b3-4eb0-825a-28f80729f30a","issue_number":1,...}]
```
