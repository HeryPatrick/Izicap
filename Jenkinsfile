pipeline {
    agent {
        docker { image 'jenkins/jenkins:lts' }
    }
    stages {
        stage('Test') {
            steps {
                sh 'jenkins --version'
            }
        }
    }
}