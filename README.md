# docker-elk

```yml

version: '3.3'
services: 

  elasticsearch:
    image: midaug/elasticsearch
    container_name: elasticsearch
    volumes:
      - ./elk/elasticsearch/config/elasticsearch.yml:/usr/share/elasticsearch/config/elasticsearch.yml:ro
    ports:
      - "9200:9200"
      - "9300:9300"
    environment:
      ES_JAVA_OPTS: "-Xms256m -Xmx512m"
    networks:
      - cloudNet

  logstash:
    image: midaug/logstash
    container_name: logstash
    volumes:
      - ./elk/logstash/config/logstash.yml:/usr/share/logstash/config/logstash.yml:ro
      - ./elk/logstash/pipeline:/usr/share/logstash/pipeline:ro
    ports:
      - "5000:5000"
    environment:
      LS_JAVA_OPTS: "-Xms256m -Xmx512m"
    networks:
      - cloudNet
    depends_on:
      - elasticsearch

  kibana:
    image: midaug/kibana
    container_name: kibana
    volumes:
      - ./elk/kibana/config/:/usr/share/kibana/config:ro
    ports:
      - "5601:5601"
    networks:
      - cloudNet
    depends_on:
      - elasticsearch

  
networks:
  cloudNet:
    driver: bridge

```
