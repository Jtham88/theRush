FROM ruby:2.5.1 
ENV BUNDLER_VERSION=2.1.4
RUN apt-get update -qq && apt-get install -y build-essential libpq-dev nodejs
RUN mkdir /app
WORKDIR /app 
ADD Gemfile /app/Gemfile
ADD Gemfile.lock /app/Gemfile.lock
ADD entrypoint.sh /app/entrypoint.sh
RUN chmod +x /app/entrypoint.sh
RUN gem update --system
RUN gem install bundler -v 2.1.4
RUN bundle install
ADD . /app