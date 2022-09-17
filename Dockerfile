# image for api application

FROM ruby:3.1.2

ENV APP_PATH /var/app
ENV BUNDLE_VERSION 2.3
# where gems are installed
ENV BUNDLE_PATH /usr/local/bundle/gems
ENV TMP_PATH /tmp/
ENV RAILS_LOG_TO_STDOUT true
ENV RAILS_PORT 3000

# create the entrypoint for the development environment
COPY ./entrypoints/dev-docker-entrypoint.sh /usr/bin/dev-entrypoint.sh
# create the entrypoint for the test environment
COPY ./entrypoints/test-docker-entrypoint.sh /usr/bin/test-entrypoint.sh

# make sure that entrypoints are executable inside our container
RUN chmod +x /usr/bin/dev-entrypoint.sh && chmod +x /usr/bin/test-entrypoint.sh

# setup dependencies for Rails
RUN apt-get update -qq \
    && apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf

RUN apt-get install -y \
apt-utils \
git \
build-essential \
libpq-dev \
libxml2-dev \
libxslt-dev \
nodejs \
yarn \
less

# used to trim down the size of the image by removing unneeded data
RUN apt-get clean autoclean \
    && apt-get autoremove -y \
    && rm -rf \
        /var/lib/apt \
        /var/lib/dpkg \
        /var/lib/cache \
        /var/lib/log

# remove the caches for the apk package manager
RUN rm -rf /var/cache/apk/*

# create the directory for the application inside docker container
RUN mkdir -p $APP_PATH

# install bundler with specified BUNDLE_VERSION
RUN gem install bundler --version "$BUNDLE_VERSION" 

# remove gem home defined by rubygems
RUN rm -rf $GEM_HOME/cache/*

#RUN service cron start

# set the working directory
WORKDIR $APP_PATH

# copy files from the host machine to the container
# ADD Gemfile* $APP_PATH/

# RUN bundle install

# expose rails port to the outside
EXPOSE $RAILS_PORT

# set the entrypoint to pass bundle exec
ENTRYPOINT [ "bundle", "exec" ]