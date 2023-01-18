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
        stage('Build') {
            steps {
                echo 'Building..'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}