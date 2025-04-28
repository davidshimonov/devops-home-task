pipeline {
    agent {
        docker {
            image 'python:3.10' // נריץ בתוך קונטיינר עם פייתון מוכן
            args '-v /var/run/docker.sock:/var/run/docker.sock' // אם תצטרך גישת Docker בהמשך
        }
    }
    stages {
        stage('Prepare Environment') {
            steps {
                echo 'Setting up virtual environment...'
                sh '''
                    python3 -m venv venv
                    . venv/bin/activate
                    pip install -r requirements.txt
                '''
            }
        }
        stage('Lint') {
            steps {
                echo 'Running flake8...'
                sh '''
                    . venv/bin/activate
                    pip install flake8
                    flake8 app
                '''
            }
        }
        stage('Test') {
            steps {
                echo 'Running tests...'
                sh '''
                    . venv/bin/activate
                    pip install pytest
                    pytest
                '''
            }
        }
        stage('Build Docker Image') {
            steps {
                echo 'Building Docker Image...'
                sh 'docker build -t devops-home-task .'
            }
        }
    }
}
