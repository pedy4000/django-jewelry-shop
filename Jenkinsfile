pipeline {
  agent any
  stages {
    stage('Basic Information') {
      steps {
        sh "echo tag: latest"
      }
    }
    stage('Build Image') {
      steps {
        script {
          if (isMaster()) {
            dockerImage = docker.build "$registry:latest"
          } else {
            dockerImage = docker.build "$registry:${params.RELEASE_TAG}"
          }
        }
      }
    }
  }
}
