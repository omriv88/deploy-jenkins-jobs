#!/bin/bash
git clone https://github.com/omriv88/deploy-jenkins-jobs.git  
cp -r -f deploy-jenkins-jobs/* ./


while true; do
  # URL to check
#my_ip=$(curl http://checkip.amazonaws.com)
  url="54.160.65.219:8080"

  # Check if URL is working
  response_code=$(curl -s -o /dev/null -w "%{http_code}" $url)
  if [ $response_code -eq 200 ]; then
    # URL is working, run the test script
    bash ./test.sh
  else
    # URL is not working
    echo "Error: URL is not working. Response code: $response_code"
  fi

  # Wait for 2 seconds before checking again
  sleep 2
done
