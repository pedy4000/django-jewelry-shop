pipeline {
  environment {
    appName = "jwerly shop"
    registry = "pedram/django-shop-server"
    registryCredential = "DjangoServerRegistry"
    projectPath = "/jenkins/data/workspace/django-server"
  }

  agent any

//  parameters {
//    gitParameter name: 'RELEASE_TAG',
//    type: 'PT_TAG',
//    defaultValue: 'master'
//    string(name: 'RELEASE_TAG', defaultValue: 'master',  description: 'tag of branch')
//  }

  stages {
    stage('Basic Information') {
      steps {
        sh "echo tag: latest"
      }
    }
    stage('Build Image') {
      steps {
        script {
          dockerImage = docker.build "$registry:latest"
        }
      }
    }
  }
}
