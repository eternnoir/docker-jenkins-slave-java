#
# Jenkins Slave Java image with ubuntu
#
# Pull base image.
FROM eternnoir/ubuntu-java
MAINTAINER Frank Wang "eternnoir@gmail.com"

# Maven Version
ENV MAVEN_VERSION 3.2.2

# Slave Name
ENV SLAVE_ID JAVA

# Install Maven
# install wget
RUN apt-get install -y wget

# get maven 3.2.2
RUN wget --no-verbose -O /tmp/maven.tar.gz http://archive.apache.org/dist/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz

# install maven
RUN tar xzf /tmp/maven.tar.gz -C /opt/
ENV MAVEN_HOME /opt/maven
ADD run.sh /home/jenkins/
CMD ["sh", "/home/jenkins/run.sh"]
