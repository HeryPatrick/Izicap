pipeline {
	agent any
	stages {
		stage('Cloning Git') {
		  steps {
			git 'https://bitbucket.org/Izicap/demo-token.git'
		  }
		}
		stage('Docker Build') {
			steps {
				script{
					sh 'docker build -t token-docker .'
				}
			}
		}	
		stage('Docker Run') {
			agent any
			steps {
				script{
					sh 'docker run -d -p 80:8080 token-docker-build'
				}
			}
		}
	}
}
