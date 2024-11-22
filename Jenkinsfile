pipeline {
  environment {
    calculator_image = 'thibaultgautheron/calculator'
    sum_image = 'thibaultgautheron/sum'
    sub_image = 'thibaultgautheron/sub'
    mul_image = 'thibaultgautheron/mul'
    div_image = 'thibaultgautheron/div'
    sum_link = 'https://github.com/AurelienPasquet/Sum_service.git'
    sub_link = 'https://github.com/AurelienPasquet/Sub_service.git'
    mul_link = 'https://github.com/AurelienPasquet/Mul_service.git'
    div_link = 'https://github.com/AurelienPasquet/Div_service.git'
    calculator_link = 'https://github.com/AurelienPasquet/Calculator_service.git'
    dockerImage = ""
    registryCredential = 'repo_login'
  
    //provide this line with one of your worker floating IP
    build_arg="--build-arg HIS_IP='40.30.20.90' ."
  }

  agent any

  stages {

    stage('Checkout Source sum') {
      steps {
        script {
          git branch: 'main', url: sum_link
        }
      }
    }
    stage('Build sum') {
      steps {
        script {
          dockerImage = docker.build sum_image
        }
      }
    }
    stage('Pushing Image sum') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Checkout Source sub') {
      steps {
        script {
          git branch: 'main', url: sub_link
        }
      }
    }
    stage('Build sub') {
      steps {
        script {
          dockerImage = docker.build sub_image
        }
      }
    }
    stage('Pushing Image sub') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Checkout Source mul') {
      steps {
        script {
          git branch: 'main', url: mul_link
        }
      }
    }
    stage('Build mul') {
      steps {
        script {
          dockerImage = docker.build mul_image
        }
      }
    }
    stage('Pushing Image mul') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }

    stage('Checkout Source div') {
      steps {
        script {
          git branch: 'main', url: div_link
        }
      }
    }
    stage('Build div') {
      steps {
        script {
          dockerImage = docker.build div_image
        }
      }
    }
    stage('Pushing Image div') {
      steps {
        script {
          docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
            dockerImage.push("latest")
          }
        }
      }
    }

    
    stage('Checkout Source calculator') {
      steps {
        script {
          git branch: 'main', url: calculator_link
        }
      }
    }
    
    stage('Setting up calculator image') {
      steps {
        script {
            // Build Docker image
            dockerImage = docker.build(calculator_image, build_arg)
            //Pushing image
            docker.withRegistry('https://registry.hub.docker.com', registryCredential) {
                dockerImage.push('latest')
          }
          
        }
      }
    }
    stage('Deploying App to Kubernetes') {
      steps {
        script {
          kubernetesDeploy(configs: "services_deployment.yml", kubeconfigId: "Kubernetes")
        }
      }
    }
  }
}
