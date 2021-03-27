FROM ruby:3.0.0-alpine3.13

ENV ROOT="/app" \
  LANG=C.UTF-8 \
  TZ=Asia/Tokyo

# WORKDIRは RUN mkdir も兼ねる
WORKDIR $ROOT

COPY Gemfile $ROOT
COPY Gemfile.lock $ROOT

RUN apk update && \
  apk upgrade && \
  apk add --no-cache \
  bash \
  tzdata \
  mariadb-connector-c && \
  apk add --virtual build-dependencies --no-cache \
  build-base \
  mariadb-connector-c-dev && \
  gem install bundler && \
  bundle install -j4 && \
  apk del build-dependencies

COPY . $ROOT

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

CMD ["rails", "server", "-b", "0.0.0.0"]