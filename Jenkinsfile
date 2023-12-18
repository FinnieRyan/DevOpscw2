pipeline {
    agent any 

    stages {
	stage('Checkout') {
	    steps {
		git branch: 'main', url: 'https://github.com/FinnieRyan/DevOpscw2.git'
	    }
          }

	  stage('Build Docker image') {
	      steps {
                  script {
                      dockerImage = docker.build("ryanfinnie/cw2-app")
                  }
	      }
          }

          
          stage('Test container') {
              steps {
                  script {
                      
                         //start container
                         sh "docker ps"
                         sh "docker run -d  --name test-container ryanfinnie/cw2-app" 
                         sh "docker ps"
                         
                         //stop and rm container                       
                         sh "docker stop test-container"
                         sh "docker rm test-container"
                  }
              }
          }


	  stage('Push to Docker') {
              steps {
                  script {
                       docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-login') {
                           sh "docker tag ryanfinnie/cw2-app registry.hub.docker.com/ryanfinnie/cw2-app:latest"
                           sh "docker push registry.hub.docker.com/ryanfinnie/cw2-app:latest"
                      }
                  }
              }
          }


	  stage('deploy to Kubernetes') {
	      steps {
        	  sshagent(['my-ssh-key']) {
          	      sh "ssh -o StrictHostKeyChecking=no ubuntu@ec2-52-207-180-172.compute-1.amazonaws.com 'bash -s' < deploy-image.sh"
                  }
              }
          }
      }
  } 
