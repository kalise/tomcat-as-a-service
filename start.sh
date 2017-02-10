#!/bin/sh
# Customize /opt/tomcat/{webapps,logs} directories
# based on the user and instance names
mkdir -p /mnt/$USER_NAME/$INSTANCE_NAME
mv /opt/tomcat/{webapps,logs} /mnt/$USER_NAME/$INSTANCE_NAME/{webapps,logs}
chmod g+rwx /mnt/$USER_NAME/$INSTANCE_NAME/{webapps,logs}
rm -rf /opt/tomcat/{webapps,logs}
ln -s /mnt/$USER_NAME/$INSTANCE_NAME/webapps /opt/tomcat/webapps
ln -s /mnt/$USER_NAME/$INSTANCE_NAME/logs /opt/tomcat/logs
