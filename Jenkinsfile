pipeline {
    agent any
    options {
       ansiColor('xterm')
    }
    
    parameters {
        choice(
            choices: ['apply', 'destroy'],
            description: 'Choose terraform command',
            name: 'terraform_'
        )
    }

    stages {
        stage('tf-init') {
            steps {
                dir('infra') {
                    echo 'Running tf-init'
                    sh '''
                        terraform init
                        pwd
                        ls -l
                    '''
                }
            }
        }
        
        stage('tf-validate') {
            steps {
                dir('infra') {
                    echo "Running tf-validate"
                    sh "terraform validate"
                }
            }
        }

        stage('tf-plan') {
            steps {
                dir('infra') {
                    echo "Running tf-plan"
                    sh "terraform plan"
                }
            }
        }
        
        stage('tf-apply') {
            when {
                expression {params.terraform_ == "apply"}
            }
            steps {
                dir('infra') {
                    echo "Running ${params.terraform_}"
                    sh "terraform ${params.terraform_} --auto-approve"
                }
            }
        }
        
        stage('tf-destroy') {
            when {
                expression {params.terraform_ == "destroy"}
            }
            steps {
                dir('infra') {
                    echo "Running ${params.terraform_}"
                    sh "terraform ${params.terraform_} --auto-approve"
                }
            }
        }
    }
    
    post {
        success { 
            echo "The pipeline succeeded!"
        }
        failure {
            echo "The pipeline failed :("
        }
        always {
            cleanWs()
            dir("${workspace_tmp}"){
                deleteDir()
            }
        }
    }
}
