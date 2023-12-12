pipeline {
    agent any 

    stages {
	stage('Checkout') {
	    steps {
		git 'https://github.com/FinnieRyan/DevOpscw2.git'
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
                    kubectl create deployment cw2app --image=ryanfinnie/cw2-app --kubeconfig=/home/ubuntu/.kube/config 
		   
                  }
              }
          }
      }
  } 
