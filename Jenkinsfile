pipeline {
    agent { node { label 'swarm-ci' } }

    environment {
        STACK_PREFIX = "my-project-stack-name"
    }

    stages {
        stage("Prepare") {
            steps {
                sh "echo hello"
            }
        }
    }
}