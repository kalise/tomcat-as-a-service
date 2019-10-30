pipeline {
  environment {
    registry = "kalise/taas"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages {
    stage('Build Image') {
      steps{
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Run Image') {
      steps {
        script {
          dockerContainer = dockerImage.run("-p 8080:8080")
        }
      }
    }
    stage('Test Image') {
      steps {
        sh './scripts/test.sh'
        input message: 'Finished using the web site? (Click "Proceed" to continue)'
      }
    }
    stage('Push Image to the Registry') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
      }
    }
    stage('Remove local image') {
      steps{
        sh "docker rmi -f $registry:$BUILD_NUMBER"
        script {
           dockerContainer.stop()
        }
      }
    }
  }
}