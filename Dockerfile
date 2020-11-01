FROM ruby:2.5

WORKDIR /home/app

ENV PORT 3000

EXPOSE $PORT

RUN gem install bundler
RUN apt-get update -qq && apt-get install -y nodejs tzdata libxslt-dev libxml2-dev

ENTRYPOINT ["/bin/bash"]