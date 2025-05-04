pipeline {
    agent any

    tools {
        nodejs 'NodeJS' // configure NodeJS under Jenkins tools
    }

    stages {
        stage('Clone') {
            steps {
                git 'https://github.com/kRehman007/CICD.git'
            }
        }

        stage('Install Dependencies') {
            steps {
                sh 'npm install'
            }
        }

        stage('SonarQube Scan') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'sonar-scanner'
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t react-app .'
            }
        }

        stage('Run Docker Container') {
            steps {
                sh 'docker run -d -p 5173:5173 react-app'
            }
        }
    }
}
