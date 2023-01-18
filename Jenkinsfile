pipeline {
    agent {
        docker { 
            image 'jenkins/jenkins:lts' 
            args '-p 8088:8088'
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