pipeline {
    agent any
    stages {
        stage('Checkout Code') {
            steps {
                echo 'Checking out the code...'
                checkout scm
            }
        }
        stage('Build') {
            steps {
                echo 'Pretending to build the project... (docker build would be here)'
            }
        }
        stage('Test') {
            steps {
                echo 'Pretending to run tests... (pytest would be here)'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Pretending to deploy... (docker run would be here)'
            }
        }
    }
}
