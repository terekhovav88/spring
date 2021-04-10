@Library('jenkins-sample-lib')_


node('gradle') {
        stage('K8S nodes'){
           kubeconfig(credentialsId: 'Kubernetes', serverUrl: 'https://192.168.1.91:6443') {
           sh 'kubectl get node'
          }
    }
}