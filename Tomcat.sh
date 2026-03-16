#!/usr/bin/bash

# 1. Install Java 8 (Required for Tomcat to run your project)
sudo dnf install -y java-1.8.0-openjdk-devel

# 2. Download and Extract Tomcat 9
cd /opt
sudo wget https://archive.apache.org
sudo tar -xf apache-tomcat-9.0.83.tar.gz
sudo mv apache-tomcat-9.0.83 tomcat9
sudo rm apache-tomcat-9.0.83.tar.gz

# 3. Set Java 8 specifically for Tomcat
# This ensures Tomcat uses Java 8 even if Java 17 is the system default
echo 'export JAVA_HOME=/usr/lib/jvm/java-1.8.0-openjdk' | sudo tee /opt/tomcat9/bin/setenv.sh
sudo chmod +x /opt/tomcat9/bin/setenv.sh

# 4. Configure Jenkins Deployment Credentials (manager-script role)
# Appends a user 'tomcat_username' with password 'tomcat_password' before the final closing tag
sudo sed -i '/<\/tomcat-users>/i \
<role rolename="manager-script"/>\
<user username="tomcat_username" password="tomcat_password" roles="manager-script"/>' /opt/tomcat9/conf/tomcat-users.xml

# 5. Remove Remote Access Restrictions
# By default, Tomcat only allows access from 'localhost'. This enables remote IP access.
sudo sed -i '/Valve/,/\/>/ s/^/<!-- /; /Valve/,/\/>/ s/$/ -->/' /opt/tomcat9/webapps/manager/META-INF/context.xml

# 6. Open RHEL 9 Firewall for Port 8080
sudo firewall-cmd --permanent --add-port=8080/tcp
sudo firewall-cmd --reload

# 7. Start Tomcat
sudo chmod +x /opt/tomcat9/bin/*.sh
sudo /opt/tomcat9/bin/startup.sh

echo "Tomcat 9 is installed and running on port 8080."
