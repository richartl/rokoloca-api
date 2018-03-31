#!/bin/bash
bundle update
bundle install
rails db:create
rails db:migrate
rails db:seed
rm /usr/src/app/tmp/pids/server.pid
rails s -b 0.0.0.0
exec "$@"
