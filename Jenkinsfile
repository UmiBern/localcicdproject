pipeline {

    agent any

    stages {

        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                sh '''
                docker build -t devops_project:latest .
                '''
            }
        }

        stage('Terraform Init') {
            steps {
                sh '''
                terraform init
                '''
            }
        }

        stage('Terraform Apply') {
            steps {
                sh '''
                terraform apply -auto-approve
                '''
            }
        }
    }
}