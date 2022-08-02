#!/bin/bash
set -x
while $1
do
    echo "Run script inside container. Call Elasticsearch from am3 dev server to delete records older than x days."
    sleep 20
	curl -X POST --header 'Authorization: Basic ZWxhc3RpYzpLaUdzYXVyeFZlN1dPVEVLSnp3Tg==' --header "Content-Type: application/json" -d '{"query": {"range": {"@timestamp": {"lte": "now-10h"}}}}' 'http://10.0.2.121:9200/logstash-2022.07.19-000001/_delete_by_query?conflicts=proceed'
done