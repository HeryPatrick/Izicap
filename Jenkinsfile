pipeline {
	agent any
	stages {
		 stage('Initialize'){
			def dockerHome = tool 'myDocker'
			env.PATH = "${dockerHome}/bin:${env.PATH}"
		}
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
