
pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Docker Build') {
            steps {
                bat 'docker build -t monapp:dev .'
            }
        }

        stage('Smoke Test') {
            steps {
                bat '''
                    docker rm -f monapp_test 2>NUL
                    docker run -d -p 8081:80 --name monapp_test monapp:dev
                    timeout /t 5 /nobreak
                    curl.exe -f http://localhost:8081/
                    docker rm -f monapp_test
                '''
            }
        }
    }
}


