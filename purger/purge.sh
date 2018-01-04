#!/usr/bin/env ash
INDICES="logstash-syslog-$(date --date="-12 months" +"%Y.%m")* logstash-metricbeat-$(date --date="-2 months" +"%Y.%m")*"
for index in ${INDICES}; do
  echo -e "\nPurging index ${index}..."
  curl -i -X DELETE --cacert /etc/elasticsearch/searchguard/ssl/ca/root-ca.crt -u ${ELASTIC_USER}:${ELASTIC_PASS} https://${ELASTIC_HOST}:${ELASTIC_PORT}/${index} 2>/dev/null
done
