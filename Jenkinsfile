pipeline {
    agent any

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

        stage('OWASP ZAP Security Scan') {
            steps {
                script {
                    // Start OWASP ZAP in Docker container
                    sh '''
                        docker run -d --name owasp-zap -p 8080:8080 owasp/zap2docker-stable
                        sleep 10  # Wait for ZAP to start
                    '''
                    
                    // Run the ZAP scan against your app
                    sh '''
                        docker exec owasp-zap zap-baseline.py -t http://localhost:5173 -g gen.conf -r zap_report.html
                    '''
                    
                    // Stop OWASP ZAP container
                    sh 'docker stop owasp-zap'
                    sh 'docker rm owasp-zap'
                }
            }
        }
    }
}
