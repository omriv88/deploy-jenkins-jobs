#!/bin/bash
sleep 25s
git clone https://github.com/omriv88/deploy-jenkins-jobs.git
cp -r -f /deploy-jenkins-jobs/* ./
my_ip=$(curl http://checkip.amazonaws.com)
curl --insecure http://$my_ip:8080/jnlpJars/jenkins-cli.jar --output jenkins-cli.jar
chmod +x jenkins-cli.jar
java -jar jenkins-cli.jar -s http://$my_ip:8080 -webSocket create-job "pull request demo" < freestyle-job.xml
java -jar jenkins-cli.jar -s http://$my_ip:8080 -webSocket create-job "pipeline" < pipeline-job.xml
