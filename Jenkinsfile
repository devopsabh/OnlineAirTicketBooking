pipeline {
    agent any

    tools {
        // Names must match your Jenkins Global Tool Configuration
        maven 'Maven 3'
        jdk 'JDK 8'
    }

    stages {
        stage('Checkout') {
            steps {
                // Using 'master' as it is the default branch for this specific repo
                git 'https://github.com/devopsabh/OnlineAirTicketBooking.git'            }
        }

        stage('Build & Package') {
            steps {
                // Package the WAR file while skipping tests that require MySQL
                sh 'mvn clean package -DskipTests'
            }
        }

        stage('Deploy to Tomcat') {
            steps {
                // 'credname' must be your Jenkins Credentials ID for Tomcat
                // url: Replace with your actual RHEL 9 server IP or hostname
               deploy adapters: [tomcat9( credentialsId: 'cred_name', path: '', url: 'tomcat_server_ip')], contextPath: 'OnlineAirTicketBooking', war: 'target/*.war'
                       
            }
        }
    }
}
