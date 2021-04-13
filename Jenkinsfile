#!groovy
@Library('jenkins-sample-lib')_

node('gradle') {
    def tag = '5.0'
    def nexusUrl = '192.168.1.140:8081/'

    stage('version') {
        version(
            "mvn"
        )
        sh "echo ${tag}"
    }

    stage('maven build') {
    input 'Do you approve build?'
        withMaven() {
           git "https://github.com/terekhovav88/spring.git"
           sh "mvn clean package -Dmaven.test.skip=true" // 'mvnw' command (e.g. "./mvnw deploy")
        }
    }

    stage('nexus upload') {
    input 'Do you approve upload?'
        nexusArtifactUploader artifacts: [[artifactId: 'spring', classifier: '', file: "target/spring-${tag}.war", type: 'war']],
        credentialsId: 'Nexus',
        groupId: 'org.terekhov',
        nexusUrl: "${nexusUrl}",
        nexusVersion: 'nexus3',
        protocol: 'http',
        repository: 'maven-releases',
        version: "${tag}"
    }

    stage('Docker build') {
    input 'Do you approve docker build?'
        docker.withRegistry('https://registry.hub.docker.com', 'atinho') {
            dockerImage = docker.build('atinho/tomcat-spring')
            }
        }

    stage('Docker push') {
            dockerImage.push("${tag}")
          }


    stage('K8S nodes') {
        input 'Do you want get nodes?'
           kubeconfig(credentialsId: 'Kubernetes', serverUrl: 'https://192.168.1.91:6443') {
           sh 'kubectl get node'
          }
    }

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
                        sh 'kubectl apply -f tomcat.yaml && kubectl apply -f service.yaml'
               }
         }
    }
}