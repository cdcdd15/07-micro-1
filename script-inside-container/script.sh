#!/bin/bash
set -x
while $1
do
    echo "Run script inside container. Call Elasticsearch from am3 dev server to delete records older than x days."
    sleep 20
	curl -X POST --header 'Authorization: Basic ZWxhc3RpYzpjaGFuZ2VtZQ==' --header "Content-Type: application/json" -d '{"query": {"range": {"@timestamp": {"lte": "now-5d"}}}}' 'http://10.0.2.121:9200/logstash-2022.01.27-000001/_delete_by_query?conflicts=proceed'
done