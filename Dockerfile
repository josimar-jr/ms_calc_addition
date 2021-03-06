FROM ruby:2.7.1-alpine

# Minimal requirements to run a Rails app
RUN apk add --no-cache --update build-base \
                                linux-headers \
                                vim \
                                git \
                                nodejs \
                                sqlite-dev \
                                tzdata

ENV APP_PATH /ms-sum

# Different layer for gems installation
WORKDIR $APP_PATH
ADD Gemfile $APP_PATH
ADD Gemfile.lock $APP_PATH
RUN bundle install --jobs `expr $(cat /proc/cpuinfo | grep -c "cpu cores") - 1` --retry 3

# Copy the application into the container
COPY . $APP_PATH

ENV RAILS_ENV development

EXPOSE 3000

# RUN EDITOR="vim --wait" /usr/local/bundle/bin/rails credentials:edit

CMD /bin/sh -c "rm -f $APP_PATH/tmp/pids/server.pid && /usr/local/bundle/bin/rails server -b 0.0.0.0"
