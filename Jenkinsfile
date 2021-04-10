@Library('jenkins-sample-lib')_

def kuberurl = 'https://192.168.1.91:6443'

node('gradle') {
        stage('K8S nodes'){
           kubeconfig(credentialsId: 'Kubernetes', serverUrl: "${kubeurl}") {
           sh 'kubectl get node'
          }
    }
}