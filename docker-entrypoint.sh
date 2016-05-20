#!/bin/bash

DIR=/docker-entrypoint.d

if [[ -d "$DIR" ]]
then
  /bin/run-parts --verbose --exit-on-error "$DIR"
fi

if [ $? -eq 0 ]; then
		exec "$@"
fi
