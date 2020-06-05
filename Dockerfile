FROM ruby:2.7.1-alpine

RUN apk update \
    && apk upgrade \
    && apk add --update --no-cache \
    build-base curl-dev git postgresql-dev \
    yaml-dev zlib-dev tzdata

WORKDIR /opt/app

ENV RAILS_ENV=production
ENV NODE_ENV=production

COPY Gemfile* ./

RUN bundle install

COPY . .

EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]
