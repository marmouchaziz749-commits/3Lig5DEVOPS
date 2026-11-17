
stage('Push to Docker Hub') {
    steps {
        withCredentials([usernamePassword(
            credentialsId: 'dockerhub-creds',
            usernameVariable: 'DOCKER_USER',
            passwordVariable: 'DOCKER_PASS'
        )]) {
            bat '''
                @echo off

                powershell -NoProfile -NonInteractive -Command "$env:DOCKER_PASS | docker login -u $env:DOCKER_USER --password-stdin; exit $LASTEXITCODE"
                if errorlevel 1 exit /b 1

                docker tag monapp:dev %DOCKER_USER%/monapp:latest
                if errorlevel 1 exit /b 1

                docker push %DOCKER_USER%/monapp:latest
                if errorlevel 1 exit /b 1

                docker logout
            '''
        }
    }
}



