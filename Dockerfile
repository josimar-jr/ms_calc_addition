FROM ruby:2.7.1-slim
RUN apt-get update -qq && apt-get install -y gcc libxml2 libxslt1.1 nodejs

RUN mkdir /ms-sum
WORKDIR /ms-sum

RUN gem install pkg-config -v "~> 1.1"
RUN gem install nokogiri -- --use-system-libraries

COPY Gemfile /ms-sum/Gemfile
COPY Gemfile.lock /ms-sum/Gemfile.lock
RUN bundle install
COPY . /ms-sum

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
