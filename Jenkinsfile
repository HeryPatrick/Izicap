pipeline {
    agent {
        docker { 
            image 'jenkins/jenkins:lts' 
            args '-p 8080:8080'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'dir'
            }
        }
    }
}