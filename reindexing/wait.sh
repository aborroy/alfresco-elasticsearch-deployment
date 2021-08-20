#!/bin/bash

TIMEOUT="${TIMEOUT:-600}"
seconds=0

echo 'Waiting up to' $TIMEOUT 'seconds for HTTP 200 from' $URL
until [ "$seconds" -gt "$TIMEOUT" ] || $(curl --output /dev/null --silent --max-time $TIMEOUT --fail http://alfresco:8080/alfresco/s/api/server); do
  printf '.'
  sleep 30
  seconds=$((seconds+30))
done

if [ "$seconds" -lt "$TIMEOUT" ]; then
  echo 'OK'
else
  echo "ERROR: Timed out wating for HTTP 200 from" $URL >&2
  exit 1
fi
