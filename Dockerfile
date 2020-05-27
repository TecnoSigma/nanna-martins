FROM ruby:2.7.1
RUN apt install curl
RUN curl -sL https://deb.nodesource.com/setup_6.x | bash -
RUN apt-get update -qq && apt-get install -y nodejs && apt-get install -y build-essential
RUN apt-get install -y npm 
RUN mkdir /nanna-martins
WORKDIR /nanna-martins
COPY Gemfile /nanna-martins/Gemfile
COPY Gemfile.lock /nanna-martins/Gemfile.lock
RUN bundle install
COPY . /nanna-martins

# Add a script to be executed every time the container starts.
COPY entrypoint.sh /usr/bin/
RUN chmod +x /usr/bin/entrypoint.sh
ENTRYPOINT ["entrypoint.sh"]
EXPOSE 3000

# Start the main process.
CMD ["rails", "server", "-b", "0.0.0.0"]
