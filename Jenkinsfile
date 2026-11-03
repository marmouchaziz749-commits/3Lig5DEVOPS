
pipeline {
    agent any

    options {
        timestamps()
    }

    stages {

        stage('Checkout') {
            steps {
                echo 'Cloning GitHub repository...'
                git url: 'https://github.com/marmouchaz749-commits/3Lig5DEVOPS.git',
                    branch: 'main'
            }
        }

        stage('Build') {
            steps {
                echo 'Building the project...'
                bat 'dir'
                bat 'echo Build completed successfully'
            }
        }

        stage('Test') {
            steps {
                echo 'Testing project files...'
                bat 'if not exist jk.html exit /b 1'
                bat 'if not exist jk.css exit /b 1'
                bat 'echo Tests passed successfully'
            }
        }

        stage('Deploy') {
            steps {
                echo 'Deploying the project...'
                bat 'echo Project is ready for deployment'
            }
        }
    }

    post {
        success {
            echo 'Build OK'
        }
        failure {
            echo 'Build KO'
        }
    }
}
