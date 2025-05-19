pipeline {
    agent any

    environment {
        // Set your values here
        AWS_ACCOUNT_ID = '253490789748'
        AWS_REGION = 'us-east-1'
        ECR_REPO = 'cloudbox-html'
        IMAGE_TAG = 'latest'
        DOCKER_IMAGE = "${AWS_ACCOUNT_ID}.dkr.ecr.${AWS_REGION}.amazonaws.com/${ECR_REPO}:${IMAGE_TAG}"
    }

    stages {
        stage('Clone from GitHub') {
            steps {
                git credentialsId: 'automation', url: 'https://github.com/your-username/cloud_box.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t $DOCKER_IMAGE .'
                }
            }
        }

        stage('Login to AWS ECR') {
            steps {
                script {
                    sh 'aws ecr get-login-password --region $AWS_REGION | docker login --username AWS --password-stdin $AWS_ACCOUNT_ID.dkr.ecr.$AWS_REGION.amazonaws.com'
                }
            }
        }

        stage('Push Image to ECR') {
            steps {
                script {
                    sh 'docker push $DOCKER_IMAGE'
                }
            }
        }
    }
}