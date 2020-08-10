#!/usr/bin/env bash


if [ "$1" = "run" ]; then
  docker-compose up --remove-orphans -d apache
else
  docker-compose run --rm -T renderd wait_for postgis:5432 -- /manage.py $@
fi
