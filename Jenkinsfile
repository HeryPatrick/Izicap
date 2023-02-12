pipeline {
	agent any
	tools{
		nodejs '19.6.0'
	}	
	options {
		// This is required if you want to clean before build
		skipDefaultCheckout(true)
    	}
	stages {
		stage('Cloning Git Token') {
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
					sh 'docker run --network=network_jenkins -d -p 80:8080 token-docker'
				}
			}
		}
		stage('Cloning Git Postman script') {
			steps {
				git 'https://github.com/HeryPatrick/test-postman.git'
			}
		}
		stage('Install dependencies') {
		    steps {
			sh 'npm install'
		    }
		}
		stage('Run test Postman script ') {
			steps {
				script{
					sh 'npm run api-tests-production'
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
