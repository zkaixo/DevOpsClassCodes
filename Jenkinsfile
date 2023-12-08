pipeline{
    agent any
    stages{
        stage("Checkout the code from github repo with akshat"){
            steps{
                git url: 'https://github.com/akshu20791/DevOpsClassCodes'
                echo 'checkout done'
            }
        }
        stage("compile the code"){
            steps{
               sh "mvn compile"
               echo "compile done"
            }
        }
        stage("test the code"){
            steps{
                sh "mvn test"
                echo "testing done"
            }
        }
        stage("qa by akshat"){
            steps{
                sh "mvn pmd:pmd"
                echo "generate report"
              //  recordIssues(tools: [pmdParser()])
            }
        }
        stage("packaging"){
            steps{
                sh "mvn package"
                echo "converted code to jar format"
            }
        }
   
     stage('Build Image') {
            steps { 
                sh 'docker build -t jarimage .'
                sh 'docker tag jarimage:latest akshu20791/addressbookimg:latest'
            }    
       }
    stage('Docker login') {
            steps { 
                withCredentials([usernamePassword(credentialsId: 'dockercred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                sh "echo $PASS | docker login -u $USER --password-stdin"
                sh 'docker push akshu20791/addressbookimg:latest'
                }
            }
       }
    }
    
    
}
