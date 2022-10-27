pipeline{
    agent any
    stages{
        stage("This is to checkout git"){
            steps{
                git 'https://github.com/vsrekul5/Jenkins.git'
            }            
        }
        stage("Build Image"){
            steps{
                sshagent(['ec2login']) {    
                    sh 'ssh -o strictHostKeyChecking=no ec2-3-89-104-141.compute-1.amazonaws.com'                               
                    sh 'docker run vsrekul/firstjenkins'                 
                }
            }            
        }
    }
}
