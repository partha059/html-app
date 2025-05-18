pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('partha059')
        DOCKER_HUB_PASSWORD = credentials('Sarathi@05000')
    }

    stages {
        stage('Clone Repository') {
            steps {
                git credentialsId: 'git-credentials', url: 'https://github.com/partha059/html-app.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t html-app .'
            }
        }

        stage('Push to Docker Registry') {
            steps {
                sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin'
                sh 'docker tag html-app $DOCKER_HUB_USERNAME/html-app:latest'
                sh 'docker push $DOCKER_HUB_USERNAME/html-app:latest'
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                sh 'kubectl apply -f deployment.yaml'
            }
        }

        stage('Check Deployment Status') {
            steps {
                sh 'kubectl get pods'
                sh 'kubectl get svc'
            }
        }
    }
}

