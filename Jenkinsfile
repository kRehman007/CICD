pipeline {
    agent any

    

    stages {
        stage('Install Dependencies') {
            steps {
                dir('F:/Web Development/CICD') {
                    bat 'npm install'
                }
            }
        }

        stage('Build React App') {
            steps {
                dir('F:/Web Development/CICD') {
                    bat 'npm run build'
                }
            }
        }

        stage('Run SonarQube Analysis') {
            steps {
                dir('F:/Web Development/CICD') {
                    withSonarQubeEnv('SonarQube') {
                        bat 'sonar-scanner'
                    }
                }
            }
        }
    }
}
