pipeline {
  environment {
    appName = "jwerly shop"
    registry = "pedram/django-shop-server"
    registryCredential = "DjangoServerRegistry"
    projectPath = "/jenkins/data/workspace/django-server"
  }

  agent any

  parameters {
//     gitParameter name: 'RELEASE_TAG',
//    type: 'PT_TAG',
//    defaultValue: 'master'
    string(name: 'RELEASE_TAG', defaultValue: 'master',  description: 'tag of branch')
  }

  stages {
    stage('Basic Information') {
      steps {
        sh "echo tag: ${params.RELEASE_TAG}"
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
  post {
    cleanup {
        sh "echo cleanup images"
        sh "docker image prune -f"
    }
  }
}

def isMaster() {
 "${params.RELEASE_TAG}" == "master"
}
