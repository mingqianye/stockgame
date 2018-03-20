FROM ruby:2.5.0-alpine3.7

RUN apk add --update build-base sqlite-dev


RUN bundle config --global frozen 1

WORKDIR /usr/src/app

#RUN gem install nokogiri --no-document -- --use-system-libraries

COPY Gemfile Gemfile.lock ./
RUN bundle install

COPY . .

ENTRYPOINT ["ls"]
