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
                recordIssues(tools: [pmdParser()])
            }
        }
        stage("packaging"){
            steps{
                sh "mvn package"
                echo "converted code to jar format"
            }
        }
    }
    
    
    
}
