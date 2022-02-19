FROM ruby:3.0
WORKDIR /var/www/nanna-martins

RUN curl -sL https://deb.nodesource.com/setup_lts.x | bash -
RUN apt-get install -y nodejs
RUN apt-get install graphviz -y


# Install Chrome
# We need wget to set up the PPA and xvfb to have a virtual screen and unzip to install the Chromedriver
RUN apt-get install -y wget xvfb unzip
# Set up the Chrome PPA
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add -
RUN echo "deb http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list
# Update the package list and install chrome
RUN apt-get update -y
RUN apt-get install -y google-chrome-stable
# Set up Chromedriver Environment variables
ENV CHROMEDRIVER_VERSION 2.19
ENV CHROMEDRIVER_DIR /chromedriver
RUN mkdir $CHROMEDRIVER_DIR
# Download and install Chromedriver
RUN wget -q --continue -P $CHROMEDRIVER_DIR "http://chromedriver.storage.googleapis.com/$CHROMEDRIVER_VERSION/chromedriver_linux64.zip"
RUN unzip $CHROMEDRIVER_DIR/chromedriver* -d $CHROMEDRIVER_DIR
# Put Chromedriver into the PATH
ENV PATH $CHROMEDRIVER_DIR:$PATH


ADD Gemfile /var/www/nanna-martins/Gemfile
ADD Gemfile.lock /var/www/nanna-martins/Gemfile.lock

RUN bash -c 'bundle install $(( [[ -z "$https_proxy" ]] && echo -n "--jobs $(nproc)") || echo -n "")'
RUN bash -c 'echo "deb http://apt.postgresql.org/pub/repos/apt/ buster-pgdg main" > /etc/apt/sources.list.d/pgdg.list'
RUN bash -c 'curl https://www.postgresql.org/media/keys/ACCC4CF8.asc | apt-key add -'
RUN apt-get update --allow-insecure-repositories
RUN apt-get install -y --no-install-recommends postgresql-client-12

EXPOSE 3000

CMD bin/rails s -b 0.0.0.0 -p 3000
