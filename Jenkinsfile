pipeline{
  agent any
  stages{
    stage("Installation of requirements"){
      steps{
        script{
          sh "python -m pip install -r requirements.txt"
        }
      }
    }  
    stage("train"){
      steps{
        script{
          sh "python train.py"
        }
      }
    }
    
    stage("build docker"){
      steps{
        script{
          dockerImage = docker.build("zain1236/app:latest")
          if (dockerImage){
            withDockerRegistry([credentialsId:"dockerhub",url:""]){
              dockerImage.push()
            }
          }
        }
      }
    } 
    
    stage("Run docker"){
      steps{
        script{
          sh "docker run -p 8080:8080 zain1236/app:latest"
        }
      }
    }
    
  }
}
