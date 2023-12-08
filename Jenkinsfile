pipeline {
    agent any
    stages {
        stage('checkout') {
            steps {
                git url:'https://github.com/akshu20791/DevOpsClassCodes/', branch: "master"
            }
        }
        stage('Build') {
            steps {
               sh "mvn clean package"
            }
        }
       
        stage('Build Image') {
            steps {
                sh 'docker build -t akshatimg .'
                sh 'docker tag akshatimg:latest akshu20791/akshatimgaddbook:latest'
            }
        }
        stage('Docker login') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockercred', passwordVariable: 'PASS', usernameVariable: 'USER')]) {
                    sh "echo $PASS | docker login -u $USER --password-stdin"
                    sh 'docker push akshu20791/akshatimgaddbook:latest'
                }
            }
        }
        stage('Deploy') {
            steps {
                script {
                    def dockerCmd = 'docker run -itd --name My-first-container -p 80:8081 akshatimgaddbook/master:latest'
                    sshagent(['sshkeypair']) {
                        sh "ssh -o StrictHostKeyChecking=no ubuntu@51.20.192.244 ${dockerCmd}"
                    }
                }
            }
        }
    }
}
