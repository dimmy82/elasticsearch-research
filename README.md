# 検索エンジン Elasticsearch について調査したことをまとめます

主に精度高く検索できるindex設計やqueryなどについて試したことをメモしておきます。

調べた内容はテーマごとに分けてメモします。各[テーマ](elasticsearch/theme)に index.json, query用json, 説明用README があります。

## 環境構築

1. ESのDockerImageをbuildする
　
```
# start from repository root
cd elasticsearch/docker
./build.sh
```

2. ESとKibanaを起動する

```
# start from repository root
cd elasticsearch
# 初回だけ
./docker_init.sh
./docker_run.sh
```

これで、 http://localhost:9200 でESへアクセスできるし、 http://localhost:5601 でKibanaへアクセスできます。
