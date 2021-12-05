pipeline {
  environment {
    imagename = "kazama7/nginx1"
    registryCredential = 'dockerhub'
    dockerImage = ''
    tag = '12.3'
  }
  agent any
  stages {
    stage('Cloning Git repository') {
      steps {
        git([url: 'https://github.com/KAZAMA7/kubecicd', branch: 'master', credentialsId: 'github'])

      }
    }
    stage('Building image') {
      steps{
        script {
          dockerImage = docker.build imagename
        }
      }
    }
    stage('Deploy Image') {
      steps{
        script {
          docker.withRegistry( '', registryCredential ) {
            dockerImage.push("$tag")
             dockerImage.push('latest')

          }
        }
      }
    }
    stage('Remove Unused docker image') {
      steps{
        sh "docker rmi $imagename:$tag"
         sh "docker rmi $imagename:latest"

      }
    }
  }
}