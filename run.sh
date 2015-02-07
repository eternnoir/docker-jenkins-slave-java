#!/bin/bash
wget -P /home/jenkins http://$MASTER_ADDR/jnlpJars/slave.jar
if [ -z "$SECRET" ]; then
    java -jar /home/jenkins/slave.jar -jnlpUrl http://$MASTER_ADDR/computer/$SLAVE_ID/slave-agent.jnlp
else
    java -jar /home/jenkins/slave.jar -jnlpUrl http://$MASTER_ADDR/computer/$SLAVE_ID/slave-agent.jnlp -secret $SECRET
fi
