pipeline {
    agent any
	tools { 
        maven 'apache-maven-3.6.3' 
        //jdk 'jdk8' 
    }
    environment {
        STACK_PREFIX = "my-project-stack-name"
    }

    stages {
        stage("Prepare") {
            steps {
                sh "echo hello"
            }
        }
        stage("Build Maven") {
            steps {
                sh "mvn clean package"
            }
        }
        /*
        stage("Clean Local Docker .sh script") {
            steps {
                sh "./sh-scripts-and-mvn-aggregate/clean-local-docker-env.sh"
            }
        }
        */
    }
}