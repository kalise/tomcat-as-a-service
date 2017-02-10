# Create the image from the latest centos image
FROM centos:latest

LABEL Version 1.0
MAINTAINER kalise <https://github.com/kalise/>

ENV MIRROR http://it.apache.contactlab.it/
ENV TOMCAT tomcat-7
ENV TOMCAT_VERSION 7.0.72
ENV JAVA_VERSION 1.7.0
ENV USER_NAME user
ENV INSTANCE_NAME instance


# Install dependencies
RUN yum update -y && yum install -y wget gzip tar

# Install jdk
RUN yum install -y java-${JAVA_VERSION}-openjdk-devel && \
yum clean all

# Install Tomcat
RUN wget -y --quiet --no-cookies http://${MIRROR}/tomcat/${TOMCAT}/${TOMCAT_VERSION}/bin/apache-tomcat-${TOMCAT_VERSION}.tar.gz -O /tmp/tomcat.tgz && \
tar xzvf /tmp/tomcat.tgz -C /opt && \
ln -s  /opt/apache-tomcat-${TOMCAT_VERSION} /opt/tomcat && \
rm /tmp/tomcat.tgz

# Add the tomcat manager users file
ADD tomcat-users.xml /opt/tomcat/conf/

# Add the tomcat starting script
ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

EXPOSE 8080

ENTRYPOINT ["/usr/local/bin/start.sh"]
