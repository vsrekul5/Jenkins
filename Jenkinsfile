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
              sh 'docker build -t vsrekul/firstjenkins .'                 
                
            }            
        }
    }
}
