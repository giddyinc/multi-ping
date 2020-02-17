#!/bin/bash

DIR=/srv/app/docker-entrypoint.d

# This will run all scripts in the docker-entrypoint.d folder, used to overwrite configs and secrets mounted to pod
if [[ -d "$DIR" ]]
then
  /bin/run-parts --verbose "$DIR"
fi

exec "$@"

