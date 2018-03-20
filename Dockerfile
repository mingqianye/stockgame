FROM ruby:2.5.0-alpine3.7

RUN apk add --update bash build-base sqlite-dev

ENV RAILS_ENV=production

RUN bundle config --global frozen 1

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

VOLUME ./db/

COPY . .

EXPOSE 8080

ENTRYPOINT ["./runserver.sh"]
