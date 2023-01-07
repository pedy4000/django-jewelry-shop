pipeline {
  environment {
    appName = "jwerly shop"
    registry = "pedram/django-shop-server"
    registryCredential = "DjangoServerRegistry"
    projectPath = "/jenkins/data/workspace/django-server"
  }

  agent any

  parameters {
    string(name: 'RELEASE_TAG', defaultValue: 'dev',  description: 'tag of branch')
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
    stage('Run Container') {
      steps {
        script {
          if (isMaster()) {
            sh "echo cleanup container"
            sh "docker stop production || true && docker rm production || true"
            sh "docker run -d -p 8000:8000 --name production $registry:latest"
          } else {
            sh "echo cleanup container"
            sh "docker stop development || true && docker rm development || true"
            sh "docker run -d -p 8001:8000 --name development $registry:${params.RELEASE_TAG}"
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
