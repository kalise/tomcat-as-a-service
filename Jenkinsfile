pipeline {
  environment {
    registry = "kalise/taas"
    registryCredential = ‘dockerhub’
  }
  
  agent any
    stage('Building image') {
      stepsi {
        git 'https://github.com/kalise/tomcat-as-a-service'
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push()
          }
        }
        sh "docker rmi $registry:$BUILD_NUMBER"
      }
    }
  }

  environment {
    CI = 'true'
  }
}
