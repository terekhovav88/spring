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
        nexusPublisher nexusInstanceId: 'NX',
        nexusRepositoryId: 'maven-snapshots',
        packages: [[$class: 'MavenPackage', mavenAssetList: [[classifier: '', extension: '', filePath: 'target/***.jar']],
        mavenCoordinate: [artifactId: 'spring', groupId: 'org.terekhov', packaging: 'jar', version: '1.1-SNAPSHOT']]]
    }
}