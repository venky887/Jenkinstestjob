pipeline {
    agent any

    environment {
        IMAGE_NAME = "flask-demo"
        DOCKERHUB_USER = credentials('dockerhub-creds') // Jenkins credentials ID
    }

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url:'https://github.com/venky887/Jenkinstestjob.git'
            }
        }

        stage('List Files') {
            steps {
                sh 'ls -la'
            }
        }

        stage('Check Docker Version') {
            steps {
                sh 'docker --version'
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t flask-demo .'
            }
        }

        stage('Docker Login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub-creds', usernameVariable: 'DOCKER_USER', passwordVariable: 'DOCKER_PASS')]) {
                    sh 'echo "$DOCKER_PASS" | docker login -u "$DOCKER_USER" --password-stdin'
                }
            }
        }

        stage('Tag Image') {
            steps {
                sh 'docker tag flask-demo venkat044/flask-demo:v0.1'
            }
        }

        stage('Push Image') {
            steps {
                sh 'docker push venkat044/flask-demo:v0.1'
            }
        }
    }
}
