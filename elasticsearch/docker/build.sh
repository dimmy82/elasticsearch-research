#! /bin/bash

docker rm -vf kibana
docker rm -vf elasticsearch

docker build --rm -t es:8.6.2 .
