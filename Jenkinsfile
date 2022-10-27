pipeline{
    agent any   
    stages{
        stage("This is to checkout git"){
            steps{
                git branch: 'main', url: 'https://github.com/vsrekul5/Jenkins.git/'
            }            
        }
        stage("Build Image"){
            steps{                    
            sh 'docker build -t vsrekul/firstjenkins:$BUILD_NUMBER .'                 
                
            }            
        }       
        stage('Publish image to Docker Hub') {
            steps {
                withDockerRegistry([ credentialsId: "vsrekul", url: "" ]) {
                    sh  'docker push vsrekul/firstjenkins:$BUILD_NUMBER'
                    
                }
                        
            }
        }
        stage("Create service from image"){
            steps{                    
              sshagent(['ubuntu']) {
                    sh 'ssh -o StrictHostKeyCheck=no ec2-54-221-38-54.compute-1.amazonaws.com'
                    sh 'docker service create --name my-jenkins --publish target=80,published=80 --replicas=2 vsrekul/firstjenkins:$BUILD_NUMBER'
              }                
                
            }            
        }


    }
}
