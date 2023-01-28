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
	}
}
