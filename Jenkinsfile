pipeline {
    agent any

    environment {
        STACK_PREFIX = "my-project-stack-name"
    }

    stages {
        stage("Prepare") {
            steps {
                sh "echo hello"
            }
        }
        stage("Clean Local Docker .sh script") {
            steps {
                sh "./sh-scripts-and-mvn-aggregate/clean-local-docker-env.sh"
            }
        }
    }
}