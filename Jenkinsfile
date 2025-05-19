pipeline {
    agent any

    environment {
        ECR_REPO = '253490789748.dkr.ecr.us-east-1.amazonaws.com/cloudbox'
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                git branch: 'master', url: 'https://github.com/ankipriya/cloud_box.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $ECR_REPO:$IMAGE_TAG .'
            }
        }

        stage('Login to ECR') {
            steps {
                sh 'aws ecr get-login-password | docker login --username AWS --password-stdin $ECR_REPO'
            }
        }

        stage('Push Image to ECR') {
            steps {
                sh 'docker push $ECR_REPO:$IMAGE_TAG'
            }
        }

        stage('Deploy with Docker Compose') {
            steps {
                sh '''
                docker-compose down
                docker-compose pull
                docker-compose up -d
                '''
            }
        }
    }
}