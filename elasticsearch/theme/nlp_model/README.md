```shell
curl -XPOST localhost:9200/_license/start_trial?acknowledge=true

git clone git@github.com:elastic/eland.git
cd eland
docker build -t elastic/eland .

docker run -it --rm elastic/eland \
    eland_import_hub_model \
      --url $ELASTICSEARCH_URL \
      --hub-model-id sentence-transformers/msmarco-MiniLM-L-12-v3 \
      --task-type text_embedding \
      --start

# Kibanaで叩く
POST /_ml/trained_models/sentence-transformers__msmarco-minilm-l-12-v3/_infer
{
  "docs": {
    "text_field": "how is the weather in tokyo"
  }
}

# Download file
# https://github.com/mayya-sharipova/msmarco/blob/main/msmarco-passagetest2019-unique.tsv

# Kibanaでfileをimportする
# https://www.elastic.co/guide/en/kibana/current/connect-to-elasticsearch.html#upload-data-kibana
```