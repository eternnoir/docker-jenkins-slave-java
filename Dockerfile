#
# Jenkins Slave Java image with ubuntu
#
# Pull base image.
FROM eternnoir/jenkins-slave
MAINTAINER Frank Wang "eternnoir@gmail.com"

# Install Java
RUN apt-get -y update
RUN apt-get -y upgrade
RUN apt-get -y install software-properties-common python-software-properties
RUN add-apt-repository ppa:webupd8team/java 
RUN apt-get -y update
RUN echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
RUN apt-get -y install oracle-java8-installer git && apt-get clean

# Maven Version
ENV MAVEN_VERSION 3.2.2

# Slave Name
ENV SLAVE_ID JAVA
ENV MASTER_ADDR

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
