#!/bin/bash
my_ip=$(curl http://checkip.amazonaws.com)
curl --insecure http://$my_ip:8080/jnlpJars/jenkins-cli.jar --output jenkins-cli.jar
chmod +x jenkins-cli.jar
java -jar jenkins-cli.jar -s http://$my_ip:8080 -webSocket create-job "pull request demo1" < freestyle1-job.xml
java -jar jenkins-cli.jar -s http://$my_ip:8080 -webSocket create-job "pipeline" < pipeline-job.xml
