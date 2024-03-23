pipeline {
    agent any

    stages {
        stage('Check Terraform Version') {
            steps {
                script {
                    sh 'terraform --version'
                }
            }
        }
    }
}
