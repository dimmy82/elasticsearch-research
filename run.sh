#! /bin/bash

docker rm -vf kibana
docker rm -vf elasticsearch

docker run -d --name elasticsearch --net es_kibana_nw -p 9200:9200 -p 9300:9300 -e "discovery.type=single-node" -e "xpack.security.enabled=false" es:8.6.2
docker run -d --name kibana --net es_kibana_nw -p 5601:5601 -e "xpack.security.enabled=false" kibana:8.6.2
