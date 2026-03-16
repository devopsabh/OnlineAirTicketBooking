# Online Air Ticket Booking System

* An online airline ticket system using Java Spring MVC and Hibernate
* Build tool used - Apache Maven
* Database vendor used - MySQL
* All JavaMail functionality upcoming

* Skipping the database configuration in our pipeline, run in build  sh 'mvn clean package -DskipTests'
* 1. Server Setup (RHEL 9)
  2. 
    sudo dnf install java-1.8.0-openjdk-devel -y
    sudo dnf install maven -y 
  2. Jenkins Configuration
     Go to Manage Jenkins > Tools.
      JDK: Add a new JDK, name it JDK 8, and set the JAVA_HOME path (typically /usr/lib/jvm/java-1.8.0-openjdk).
      Maven: Add a new Maven installation named Maven 3.


