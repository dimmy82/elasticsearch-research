FROM elasticsearch:9.0.1

USER root
RUN sysctl -w vm.max_map_count=262144
RUN microdnf install -y jq && microdnf clean all

USER elasticsearch
ENV ES_BASE=/usr/share/elasticsearch

RUN echo 'action.auto_create_index: false' >> $ES_BASE/config/elasticsearch.yml
# if search-client can not config a proxy, comment in this two lines
# RUN echo 'http.cors.enabled: true' >> $ES_BASE/config/elasticsearch.yml
# RUN echo 'http.cors.allow-origin: "*"' >> $ES_BASE/config/elasticsearch.yml

RUN $ES_BASE/bin/elasticsearch-plugin install analysis-icu
RUN $ES_BASE/bin/elasticsearch-plugin install analysis-kuromoji

ADD init.sh $ES_BASE/init.sh

CMD ["bash", "/usr/share/elasticsearch/init.sh"]
