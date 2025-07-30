pipeline {
    agent any

    environment {
        ACR_URL = 'jihoonacr-aucthhbfcshnhhbr.azurecr.io'
        IMAGE_NAME = 'myapp'
        CREDENTIALS_ID = 'acr-admin'
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    docker.build("${IMAGE_NAME}")
                }
            }
        }

        stage('Push to ACR') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: "${CREDENTIALS_ID}",
                    usernameVariable: 'ACR_USER',
                    passwordVariable: 'ACR_PASS')]) {
                    sh """
                        echo $ACR_PASS | docker login ${ACR_URL} -u $ACR_USER --password-stdin
                        docker tag ${IMAGE_NAME} ${ACR_URL}/${IMAGE_NAME}:latest
                        docker push ${ACR_URL}/${IMAGE_NAME}:latest
                    """
                }
            }
        }
    }
}
