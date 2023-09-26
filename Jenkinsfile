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
                sh 'sudo docker version'
            }
        }

        stage('images') {
            steps {
                sh 'sudo docker images'
            }


        }

        stage('ecr-login') {
            steps {
                sh 'sudo aws ecr get-login-password --region us-east-1 | docker login --username AWS --password-stdin 326541723545.dkr.ecr.us-east-1.amazonaws.com'
            }
        }

        stage('Build') {
            steps {
                sh 'sudo docker build -t nginx:v1 .'
            }
        }

        stage('Tag') {
            steps {
                sh 'sudo docker tag nginx:v1 326541723545.dkr.ecr.us-east-1.amazonaws.com/imagessecr:v2'
            }
        }

        stage('push') {
            steps {
                sh 'sudo docker push 326541723545.dkr.ecr.us-east-1.amazonaws.com/imagessecr:v2'

            }
            
        }
    }

    
}
