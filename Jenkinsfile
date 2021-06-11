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
        stage("Docker") {
            steps {
                sh "docker --version"
            }
        }
        stage("Ping") {
            steps {
                sh "ping host.docker.internal"
            }
        }
        */
        stage("Host .sh script") {
            steps {
                //sh "ssh Cosmin Dinu@host.docker.internal ./c/javaDev/workspace/07-micro-1/sh-scripts-and-mvn-aggregate/clean-local-docker-env.sh"
                sh "ssh "Cosmin Dinu"@host.docker.internal ./c/javaDev/workspace/07-micro-1/sh-scripts-and-mvn-aggregate/basic-script-examples/function-test.sh"
                sh "whoami"
            }
        }
        stage("Local .sh script") {
            steps {
                sh "./sh-scripts-and-mvn-aggregate/clean-local-docker-env.sh"
            }
        }
    }
}