#!/bin/bash
set -x
while $1
do
    echo "Check is up.."
    sleep 5
	curl -X GET --header 'Authorization: Basic ZWxhc3RpYzpjaGFuZ2VtZQ==' 'http://dev03rex.vrsspharma.com:9200/'
done