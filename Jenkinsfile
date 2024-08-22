pipeline {
    agent any
    tools {
        jdk 'jdk17' 
    }

    stages {
        stage('Clear Workspace') {
            steps {
                cleanWs()
            }
        }

        stage('Checkout Code') {
            steps {
                git branch: 'main', changelog: false, poll: false, url: 'https://github.com/Web-Development-Project-with-DevOps/E-commerce.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t ecommarce .'
                }
            }
        }

        stage('Trivy Image Scanning') {
            steps {
                sh 'trivy fs . > trivy.txt'
            }
        }

        stage('Docker Tag and Push') {
            steps {
                script {
                    withDockerRegistry(credentialsId: 'dockerhub', toolName: 'docker') {
                        sh 'docker tag ecommarce pranav08/ecommarce'
                        sh ' docker push pranav08/ecommarce'
                    }
                }
            }
        }

        stage('Trivy Image Scan') {
            steps {
                sh 'trivy image pranav08/ecommarce > trivyimage.txt'
            }
        }

        stage('Run Docker Container') {
            steps {
                script {
                    sh 'docker run -d  --name ecommarce -p 8081:80 pranav08/ecommarce'
                }
            }
        }
    }
}
