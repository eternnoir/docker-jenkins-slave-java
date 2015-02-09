# docker-jenkins-slave-java
## Tags

* latest (default jdk)
* openjdk-7
* oracle-java6
* oracle-java7
* oracle-java8

## Run
You should create a slave node at Jenkins master. Then run this slave image use environment *SLAVE_ID* and *MASTER_ADDR* let container connet to Jenkins master automatically.

```
docker run -d -e SLAVE_ID=<slaveId> -e MASTER_ADDR=<master_jekinsIP:Port> eternnoir/jenkins-slave-java
```

If your node need secret key.
```
docker run -d -e SLAVE_ID=<slaveId> -e MASTER_ADDR=<master_jekinsIP:Port> -e SECRET=<secret_key> \
          eternnoir/jenkins-slave-java
```
