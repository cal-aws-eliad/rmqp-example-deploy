pipeline {
   agent { label 'helm' }

    environment {
        GIT_REPO = 'https://github.com/cal-aws-eliad/rmqp-example-deploy.git'
        CHART_NAME = 'rmqp-example'
        NAMESPACE = 'default' // Change this to your target namespace
    }

    stages {
        stage('Clone Repository') {
            steps {
                git url: "${env.GIT_REPO}"
            }
            
        }

        stage('Package Helm Chart') {
            steps {
                script { bat 'helm package ./${env.CHART_NAME}/' }
            }
        }

        stage('Upgrade Deployment') {
            steps {
                script { bat 'helm upgrade --install ${env.CHART_NAME} ./${env.CHART_NAME}-*.tgz --namespace ${env.NAMESPACE}' }
            }
        }
    }
}