pipeline {
  agent none
      stages {
        stage('Shellcheck node.sh') {
          agent {
            label 'slave'
          }
          steps {
            sh 'sudo shellcheck /var/lib/jenkins/node.sh'
          }
        }
        
        stage('Deploy nodeJS') {
          agent {
            label 'slave'
          }
          steps {
            sh 'sudo /var/lib/jenkins/node.sh'
          }
        }
        stage('Test if nodeJS is running fine') {
          agent {
            label 'slave'
          }
          steps {
            sh 'sudo /var/lib/jenkins/test_node.sh'
          }
        }
      } 
}