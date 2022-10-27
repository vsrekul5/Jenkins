pipeline{
    agent any
    stages{
        stages{
            stage("This is to checkout git"){
                steps{
                    git branch: 'main', url: 'https://github.com/vsrekul5/Jenkins.git/'
                }            
            }
            stage("Build Image"){
                steps{                    
                sh 'docker build -t vsrekul/firstjenkins .'                 
                    
                }            
            }
        }
        stage('Login') {

            steps {
                sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u vsrekul --password-stdin'
            }
        }
        stage("Docker Push"){
            withCredentials([gitUsernamePassword(credentialsId: 'vsrekul', gitToolName: 'Default')]) {
              sh "docker login -u vsrekul -p ${vsrekul}"
            }
            sh "docker push vsrekul/firstjenkins:1.0"
            
        }
        stage("Build Image"){
            steps{                    
              sshagent(['ubuntu']) {
                    sh 'ssh -o StrictHostKeyCheck=no ec2-54-221-38-54.compute-1.amazonaws.com'
                    sh 'docker service create --name my-jenkins --publish target=80,published=80 --replicas=2 vsrekul/firstjenkins:1.0'
              }                
                
            }            
        }


    }
}
