#!/bin/sh

# Customize tomcat/webapps and tomcat/logs directories
# based on the user and instance names
mkdir -p /mnt/$USER_NAME/$INSTANCE_NAME
mv /opt/tomcat/{webapps,logs} /mnt/$USER_NAME/$INSTANCE_NAME/
chmod g+rwx /mnt/$USER_NAME/$INSTANCE_NAME/{webapps,logs}
rm -rf /opt/tomcat/{webapps,logs}
ln -s /mnt/$USER_NAME/$INSTANCE_NAME/webapps /opt/tomcat/webapps
ln -s /mnt/$USER_NAME/$INSTANCE_NAME/logs /opt/tomcat/logs

# Start the Tomcat
/opt/tomcat/bin/catalina.sh run
