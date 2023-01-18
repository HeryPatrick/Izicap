pipeline {
    agent {
        docker { 
            image 'nginx:latest' 
            args '-p 80:80'
        }
    }
    stages {
        stage('Test') {
            steps {
                sh 'cat /etc/nginx/conf.d/default.conf'
            }
        }
    }
}