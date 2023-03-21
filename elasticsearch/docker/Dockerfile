FROM elasticsearch:8.6.2

ENV ES_BASE /usr/share/elasticsearch

RUN $ES_BASE/bin/elasticsearch-plugin install analysis-icu
RUN $ES_BASE/bin/elasticsearch-plugin install analysis-kuromoji

ADD init.sh $ES_BASE/init.sh

ENV ES_JAVA_OPTS "-Xms2g -Xmx4g"
CMD ["bash", "/usr/share/elasticsearch/init.sh"]
