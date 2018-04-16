FROM ruby:2.4.1
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /space
WORKDIR /space
COPY Gemfile /space/Gemfile
COPY Gemfile.lock /space/Gemfile.lock
RUN bundle install
COPY . /space
