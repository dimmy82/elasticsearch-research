#! /bin/bash

echo 'http.cors.enabled: true' >> $ES_BASE/config/elasticsearch.yml
echo 'http.cors.allow-origin: "*"' >> $ES_BASE/config/elasticsearch.yml

/usr/local/bin/docker-entrypoint.sh
