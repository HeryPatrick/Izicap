pipeline {
	agent any
	options {
		// This is required if you want to clean before build
		skipDefaultCheckout(true)
    	}
	stages {
		stage('Cloning Git') {
			steps {
				// Clean before build
                		cleanWs()

				git 'https://bitbucket.org/Izicap/demo-token.git'
			}
		}
		stage('Docker Build') {
			steps {
				script{
					// We need to explicitly checkout from SCM here
					checkout scm
					sh 'docker build -t token-docker .'
				}
			}
		}	
		stage('Docker Run') {
			steps {
				script{
					sh 'docker run -d -p 80:8080 token-docker'
				}
			}
		}
	}
	post {
        // Clean after build
        always {
            cleanWs(cleanWhenNotBuilt: false,
				deleteDirs: true,
				disableDeferredWipeout: true,
				notFailBuild: true,
				patterns: [[pattern: '.gitignore', type: 'INCLUDE'],
						   [pattern: '.propsfile', type: 'EXCLUDE']])
        }
    }
}
