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
                      dockerImage.inside {
                          //add tests 
                      }
                  }
              }
          }


	  stage('Push to Docker') {
              steps {
                  script {
                      docker.withRegistry('https://registry.hub.docker.com', 'dockerhub-login') {
                          dockerImage.push("ryanfinnie/cw2-app:latest")
                      }
                  }
              }
          }


	  stage('deploy to Kubernetes') {
	      steps {
                  script {
                      sh("kubectl set image deployment/cw2app cw2app=ryanfinnie/cw2-app:latest --kubeconfig=/home/ubuntu/.kube/config") 
		   
                  }
              }
          }
      }
  } 
