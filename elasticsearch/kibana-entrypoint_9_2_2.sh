#!/bin/bash
set -e

TOKEN_RESPONSE=$(curl -s -u "elastic:${ELASTIC_PASSWORD}" -X POST "${ELASTICSEARCH_HOSTS}/_security/service/elastic/kibana/credential/token/token-for-kibana")

TOKEN=$(echo "$TOKEN_RESPONSE" | grep -oP '\"value\":\"\K[^\"]+')

ELASTICSEARCH_SERVICEACCOUNTTOKEN="$TOKEN" /usr/local/bin/kibana-docker