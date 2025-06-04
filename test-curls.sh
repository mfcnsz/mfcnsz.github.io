#!/bin/bash
# Simple script to test SEO Killer API endpoints
# Usage: ./test-curls.sh [BASE_URL] [API_KEY]

BASE_URL="${1:-https://example.com}"
API_KEY="${2:-YOUR_API_KEY}"

# Function to perform a curl request
function request() {
  local method=$1
  local path=$2
  local data=$3
  if [[ $method == "GET" ]]; then
    curl -s -X $method "$BASE_URL$path" -H "X-SEOKILLER-API-KEY: $API_KEY"
  else
    curl -s -X $method "$BASE_URL$path" -H "X-SEOKILLER-API-KEY: $API_KEY" -H "Content-Type: application/json" -d "$data"
  fi
  echo -e "\n"
}

# Example requests
request GET "/wp-json/seokiller/v1/debug" ""
request POST "/wp-json/seokiller/v1/get-site-info" "{}"
request POST "/wp-json/seokiller/v1/get-categories" "{}"
request POST "/wp-json/seokiller/v1/get-posts" "{}"
request POST "/wp-json/seokiller/v1/get-post/1" "{}"
request POST "/wp-json/seokiller/v1/create-content" '{"title":"Test Post","content":"Hello"}'
request POST "/wp-json/seokiller/v1/diagnostic" "{}"
request GET "/wp-json/seokiller/v1/openai-test" ""

