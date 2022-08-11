#!/bin/bash

## read the input from user ##
read -p " Enter json object: " json
read -p " Enter key: " json_key

##convert / into . for jq##
jq_json_key=`echo .$json_key | tr '/' '.'`

##result ##
echo $json | jq $jq_json_key
