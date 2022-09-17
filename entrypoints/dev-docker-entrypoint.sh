#!/usr/bin/env sh

# file to copied to docker container and will go run with bash shell

set -e

echo "ENVIRONMENT: $RAILS_ENV"

# check bundle
bundle check || bundle install

bundle exec rake db:migrate 2>/dev/null || bundle exec rake db:setup

bundle exec rake db:seed:players
bundle exec rake db:seed:users

# remove pid from previous session (puma server)
rm -f $APP_PATH/tmp/pids/server.pid

# run anything by prepending bundle exec to the passed command
bundle exec ${@}
