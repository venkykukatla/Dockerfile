pipeline {
    agent any

    stages {
        stage('clone') {
            steps {
                checkout scmGit(branches: [[name: '*/master']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/venkykukatla/Dockerfile.git']])
            }
        }

        stage('version') {
            steps {
                sh 'docker version'
            }
        }

        stage('image') {
            steps {
                sh 'docker images'
            }
        }

        stage('ecr login') {
            steps{
                sh 'aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 326541723545.dkr.ecr.us-east-1.amazonaws.com'
            }
        }

        stage('build') {
            steps {
                sh 'docker build -t amazonecr .'

            }
        }

        stage('Tag') {
            steps {
                sh 'docker tag amazonecr:latest 326541723545.dkr.ecr.us-east-1.amazonaws.com/amazonecr:latest'
            }

        }

        stage('push') {
            steps {
                sh 'docker push 326541723545.dkr.ecr.us-east-1.amazonaws.com/amazonecr:latest'
            }
        }
    }
}
