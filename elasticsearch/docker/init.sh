#! /bin/bash

# if search-client can not config a proxy, comment in this two lines
# echo 'http.cors.enabled: true' >> $ES_BASE/config/elasticsearch.yml
# echo 'http.cors.allow-origin: "*"' >> $ES_BASE/config/elasticsearch.yml

/usr/local/bin/docker-entrypoint.sh
