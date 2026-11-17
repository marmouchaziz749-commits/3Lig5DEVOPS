
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
                    @echo off
                    docker rm -f monapp_test 2>NUL
                    docker run -d -p 8086:80 --name monapp_test monapp:dev
                    if errorlevel 1 exit /b 1

                    powershell -NoProfile -Command "Start-Sleep -Seconds 5"

                    curl.exe --fail --silent --show-error http://localhost:8086/
                    if errorlevel 1 (
                        docker rm -f monapp_test
                        exit /b 1
                    )

                    docker rm -f monapp_test
                '''
            }
        }
    }
}


