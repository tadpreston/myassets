FROM ruby:2.5-alpine

RUN apk update && apk add build-base nodejs postgresql-dev

RUN mkdir /app
WORKDIR /app

COPY Gemfile Gemfile.lock ./
RUN bundle install --binstubs

COPY . .

LABEL maintainer="Tad Preston tadpreston@gmail.com>"

CMD puma -C config/puma.rb
