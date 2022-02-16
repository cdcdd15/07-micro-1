#!/bin/bash
set -x
curl -X POST --header 'Authorization: Basic ZWxhc3RpYzpjaGFuZ2VtZQ==' --header "Content-Type: application/json" -d '{ "query": { "match_all": {} } }' 'http://dev03rex.vrsspharma.com:9200/logstash-2022.01.27-000001/_delete_by_query?conflicts=proceed'