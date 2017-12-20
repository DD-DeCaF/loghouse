## House of logs

Dockerized ELK stack + Logspout, configured for Docker Cloud

### Stack

* [khezen/elasticsearch](https://github.com/Khezen/docker-elasticsearch) (includes [elasticsearch](https://www.elastic.co/) + [Search Guard](https://floragunn.com/))
* [logstash](https://www.elastic.co/products/logstash)
* [khezen/kibana](https://github.com/khezen/docker-kibana)
* [logspout](https://github.com/gliderlabs/logspout)
* [metricbeat](https://www.elastic.co/downloads/beats/metricbeat)

### Configuration

* Data is stored locally in `./elasticsearch/data`
* Config is stored locally in `./elasticsearch/config`
* Note that the config volume must be readable by other services

### Usage

    docker-compose up

Note that on the very first startup, it takes some seconds to generate certificates and services depending on these may exit prematurely. Simply restart these services after all certificates are properly generated.

To view the kibana dashboard, visit http://localhost:5601/ in your browser or run:

    http get https://localhost:9200/ --auth elastic:changeme --verify no
    # To see metricbeat data from your local system:
    http get https://localhost:9200/metricbeat-\*/_search\?pretty --auth elastic:changeme --verify no
