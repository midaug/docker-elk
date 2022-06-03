ARG ELK_VERSION

# https://github.com/elastic/logstash-docker
FROM docker.elastic.co/logstash/logstash${ELK_VERSION}

/usr/share/logstash/logstash-plugin install logstash-filter-json_encode
# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json
