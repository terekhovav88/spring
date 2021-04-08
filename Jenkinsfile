@Library('jenkins-sample-lib')_

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
        nexusArtifactUploader artifacts: [[artifactId: 'spring', classifier: '', file: 'target/spring-1.1-SNAPSHOT.jar', type: 'jar']],
        credentialsId: 'Nexus',
        groupId: 'org.terekhov',
        nexusUrl: '192.168.1.140:8081/',
        nexusVersion: 'nexus3',
        protocol: 'http',
        repository: 'maven-snapshots',
        version: '1.1-SNAPSHOT'
    }
}