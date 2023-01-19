pipeline {
    agent {
        docker { 
            image 'demo-token:latest' 
            args '-p 80:8080'
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