@Library('jenkins-sample-lib')_

def kuberUrl = 'https://192.168.1.91:6443'

node('gradle') {
        stage('K8S nodes'){
           kubeconfig(credentialsId: 'Kubernetes', serverUrl: "${kubeUrl}") {
           sh 'kubectl get node'
          }
    }
}