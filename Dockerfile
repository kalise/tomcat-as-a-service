# Create the image from the latest rhel7 image
FROM registry.access.redhat.com/rhel7:latest

LABEL Version 1.0
MAINTAINER kalise <https://github.com/kalise/>

# Install dependencies
RUN yum --disablerepo=* --enablerepo=rhel-7-server-rpms install -y java-1.7.0-openjdk-devel

# Add tomcat binaries
ADD apache-tomcat-7.0.72 /var/tomcat

# Add the tomcat starting script
ADD start.sh /usr/local/bin/start.sh
RUN chmod +x /usr/local/bin/start.sh

# Add the manager web app
ADD manager /var/tomcat/webapps

# Declare Env variables
ENV INSTANCENAME="Tomcat"
ENV JAVA_OPTS="-XX:MaxPermSize=1024m -XX:PermSize=512m"

ENTRYPOINT ["/usr/local/bin/start.sh"]
