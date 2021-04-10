@Library('jenkins-sample-lib')_

node('gradle') {

    stage('Kubernetets deploy'){
    input 'Do you approve deployment?'
               checkout([$class: 'GitSCM',
                           branches: [[name: '*/master']],
                           extensions: [],
                           userRemoteConfigs: [[
                           credentialsId: 'f8413abe-394d-4162-98d5-842a7e37942d',
                            url: 'https://github.com/terekhovav88/spring.git'
                            ]]])
               dir('Kubernetes') {
                   kubeconfig(credentialsId: 'Kubernetes', serverUrl: 'https://192.168.1.91:6443') {
                        sh 'kubectl delete -f tomcat.yaml && kubectl delete -f service.yaml'
               }
         }
    }
}