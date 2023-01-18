pipeline {
    agent {
        docker { 
            image 'jenkins/jenkins:lts' 
            -p 8080:8080
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'jenkins --version'
            }
        }
    }
}