#!/bin/bash
wget -P /home/jenkins http://$MASTER_ADDR/jnlpJars/slave.jar
java -jar /home/jenkins/slave.jar -jnlpUrl http://$MASTER_ADDR/computer/$SLAVE_ID/slave-agent.jnlp
