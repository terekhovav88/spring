@Library('jenkins-sample-lib')_

def tag = '2.1'
def image = 'tomcat-spring'
def nexusUrl = '192.168.1.140:8081/'
def file = 'my-app.jar'

node('gradle') {
    stage('version') {
        version(
            "mvn"
        )
    }
    stage('maven build') {
        withMaven() {
           git "https://github.com/terekhovav88/spring.git"
           sh "mvn clean package -Dmaven.test.skip=true" // 'mvnw' command (e.g. "./mvnw deploy")
        }
    }
    stage('nexus upload'){
        nexusArtifactUploader artifacts: [[artifactId: 'spring', classifier: '', file: "target/${file}", type: 'jar']],
        credentialsId: 'Nexus',
        groupId: 'org.terekhov',
        nexusUrl: '${nexusUrl}',
        nexusVersion: 'nexus3',
        protocol: 'http',
        repository: 'maven-snapshots',
        version: '${tag}-SNAPSHOT'
    }
    stage('checkout') {
            checkout([$class: 'GitSCM',
            branches: [[name: '*/master']],
            extensions: [],
            userRemoteConfigs: [[credentialsId: 'f8413abe-394d-4162-98d5-842a7e37942d', url: 'https://github.com/terekhovav88/spring.git']]])
       }

        stage('build') {
        docker.withRegistry('https://registry.hub.docker.com', 'atinho') {
            dockerImage = docker.build('atinho/${image}')
            }
        }

        stage('push') {
            dockerImage.push('2.1')
          }
}