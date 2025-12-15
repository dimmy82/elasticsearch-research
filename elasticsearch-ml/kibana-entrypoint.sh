#!/bin/bash
set -e

# セキュリティインデックスが利用可能になるまで待機
echo "Waiting for security index to be available..."
for i in {1..60}; do
  if curl -s -u "elastic:${ELASTIC_PASSWORD}" "${ELASTICSEARCH_HOSTS}/.security-7/_search" > /dev/null 2>&1; then
    echo "Security index is ready."
    break
  fi
  if [ $i -eq 60 ]; then
    echo "Timeout waiting for security index"
    exit 1
  fi
  sleep 2
done


TOKEN_RESPONSE=$(curl -s -u "elastic:${ELASTIC_PASSWORD}" -X POST "${ELASTICSEARCH_HOSTS}/_security/service/elastic/kibana/credential/token/token-for-kibana")
echo "$TOKEN_RESPONSE"

TOKEN=$(echo "$TOKEN_RESPONSE" | grep -oP '\"value\":\"\K[^\"]+')
echo "$TOKEN"

export ELASTICSEARCH_SERVICEACCOUNTTOKEN="$TOKEN"
/usr/local/bin/kibana-docker