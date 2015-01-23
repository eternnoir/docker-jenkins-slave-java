#!/bin/bash
wget -P /home/jenkins http://master:$MASTER_PORT_8080_TCP_PORT/jnlpJars/slave.jar
java -jar /home/jenkins/slave.jar -jnlpUrl http://master:$MASTER_PORT_8080_TCP_PORT/computer/$SLAVE_ID/slave-agent.jnlp
