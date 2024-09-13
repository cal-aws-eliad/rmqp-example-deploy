pipeline {
    agent any

    environment {
        GIT_REPO = 'https://github.com/cal-aws-eliad/rmqp-example-deploy.git'
        CHART_NAME = 'rmqp-example'
        NAMESPACE = 'default' // Change this to your target namespace
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${GIT_REPO}"
            }
        }

        stage('Package Helm Chart') {
            steps {
                sh 'helm package ${CHART_NAME}'
            }
        }

        stage('Upgrade Deployment') {
            steps {
                sh 'helm upgrade --install ${CHART_NAME} ./${CHART_NAME}-*.tgz --namespace ${NAMESPACE}'
            }
        }
    }

    post {
        success {
            echo 'Deployment successful!'
        }
        failure {
            echo 'Deployment failed!'
        }
    }
}