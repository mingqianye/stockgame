FROM ruby:2.5.0-alpine3.7

RUN echo "http://mirrors.aliyun.com/alpine/v3.7/main/" > /etc/apk/repositories

RUN apk add --update bash build-base sqlite-dev

ENV RAILS_ENV=production

RUN bundle config --global frozen 1
RUN bundle config mirror.https://rubygems.org https://gems.ruby-china.org

WORKDIR /usr/src/app

COPY Gemfile Gemfile.lock ./
RUN bundle install

VOLUME /db
VOLUME /data

COPY . .

EXPOSE 8080

ENTRYPOINT ["./runserver.sh"]
