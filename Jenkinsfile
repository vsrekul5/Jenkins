pipeline{
    agent any  
    environment {
		DOCKERHUB_CREDENTIALS=credentials('vsrekul')
	} 
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
                sh 'docker login -u $DOCKERHUB_CREDENTIALS_USR -p $DOCKERHUB_CREDENTIALS_PSW'
                //sh 'docker login -u vsrekul -p vijay@100*'
                sh  'docker push vsrekul/firstjenkins:$BUILD_NUMBER'
                  
                }
                        
            }
        
        stage("Create service from image"){
            steps{                    
              sshagent(['ubuntu']) {
                    sh 'ssh -t -t ubuntu@ec2-54-221-38-54.compute-1.amazonaws.com -o StrictHostKeyChecking=no docker service create --name my-jenkins-1 -p 8051:80 --replicas=2 vsrekul/firstjenkins:$BUILD_NUMBER'
                    //sh 'docker service create --name my-jenkins-1 -p 8051:80 --replicas=2 vsrekul/firstjenkins:$BUILD_NUMBER'
              }                
                
            }            
        }

    }
}
