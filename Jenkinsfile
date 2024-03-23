pipeline {
    agent any

    stages {
        stage('tf-init') {
            steps {
                dir("infra") {
                    echo "Running Tf-init"
                    sh "terraform init"
                }
            }
        }
        stage('tf-validate') {
            steps {
                dir("infra") {
                    echo "running Tf-Validate"
                    sh "terraform validate"
                }
            }
        }
        stage('tf-plan') {
            steps {
                dir("infra") {
                    echo "running Tf-plan"
                    sh "terraform plan"
                }
            }
        }
        stage('tf-apply') {
            steps {
                dir("infra") {
                    echo "running Tf-apply"
                    sh "terraform apply"
                }
            }
        }
    }

    post {
        success {
            echo "The pipeline ran successfully"
        }
        failure {
            echo "The pipeline failed :("
        }
        always {
            cleanWs()
        }
    }
}