#!/bin/bash
git clone https://github.com/omriv88/deploy-jenkins-jobs.git  
cp -r -f deploy-jenkins-jobs/* ./


while true; do
my_ip=$(curl http://checkip.amazonaws.com)
  url="$my_ip:8080"
  response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
  if [ $response_code -eq 200 ]; then
    bash ./test.sh
  else
    echo "Error: URL is not working. Response code: $response_code"
  fi
  
  sleep 2
done
