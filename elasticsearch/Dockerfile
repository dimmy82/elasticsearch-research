FROM elasticsearch:8.6.2

ENV ES_BASE /usr/share/elasticsearch

RUN $ES_BASE/bin/elasticsearch-plugin install analysis-icu
RUN $ES_BASE/bin/elasticsearch-plugin install analysis-kuromoji
