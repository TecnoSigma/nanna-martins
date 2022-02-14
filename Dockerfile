FROM ruby:3.0
WORKDIR /var/www/nanna-martins

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install graphviz -y

ADD Gemfile /var/www/nanna-martins/Gemfile
ADD Gemfile.lock /var/www/nanna-martins/Gemfile.lock

RUN bash -c 'bundle install $(( [[ -z "$https_proxy" ]] && echo -n "--jobs $(nproc)") || echo -n "")'
RUN bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN bash -c 'curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -'
RUN apt-get update --allow-insecure-repositories
RUN apt-get install -y --no-install-recommends postgresql-client-12

EXPOSE 3000

CMD bin/rails s -b 0.0.0.0 -p 3000
