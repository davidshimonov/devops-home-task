pipeline {
    agent any

    environment {
        IMAGE_NAME = "davidshimonov1994/devops-flask-app"
        TAG = "latest"
    }

    stages {
        stage('Prepare Environment') {
            steps {
                echo 'Setting up virtual environment...'
                sh '''
                    python3 -m venv venv
                    ./venv/bin/pip install --upgrade pip
                    ./venv/bin/pip install -r requirements.txt
                    ./venv/bin/pip install flake8 pytest
                '''
            }
        }

        stage('Lint') {
            steps {
                echo 'Running flake8...'
                sh '''
                    ./venv/bin/flake8 app/
                '''
            }
        }

        stage('Test') {
            steps {
                echo 'Running tests with pytest...'
                sh '''
                    ./venv/bin/pytest app/tests/
                '''
            }
        }

        stage('Build Docker Image') {
            steps {
                echo 'Building Docker image...'
                sh '''
                    docker build -t $IMAGE_NAME:$TAG .
                '''
            }
        }

        stage('Push Docker Image') {
            steps {
                echo 'Pushing Docker image to Docker Hub...'
                withCredentials([usernamePassword(credentialsId: 'dockerhub-credentials', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh '''
                        echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin
                        docker push $IMAGE_NAME:$TAG
                    '''
                }
            }
        }
    }
}
