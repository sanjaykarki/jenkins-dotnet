pipeline {
    agent any

    stages {
        stage('Clone') {
            steps {
                echo "Cloning from github..."
                git branch: 'main', url: 'https://github.com/serilog/serilog-sinks-file.git'
                
            }
        }
        stage('Check'){
            steps {
                script {
                    sh '''
                    echo "Cheking .NET info and installed SDK..."
                    set -e 
                    dotnet --info
                    dotnet --list-sdks
                    dotnet restore
                    '''
                }
            }
        }
        stage('Build'){
            steps{
                script{
                    sh '''
                    echo "Attempting to build..."
                    for path in src/**/*.csproj; do
                        dotnet build -f netstandard1.3 -c Release ${path}
                        dotnet build -f netstandard2.0 -c Release ${path}
                    done
                    '''
                }
            }
        }
        stage('Test'){
            steps{
                script{
                    sh '''
                    echo "Running tests..."
                        for path in test/*.Tests/*.csproj; do
                        dotnet test -f netcoreapp2.0  -c Release ${path}
                    done
                    '''
                }
            }
        }
        stage('Save'){
            steps{
                script{
                    sh'''
                    echo "Saving artifacts..."
                    dotnet pack -o ./artifacts
                    '''
                }
            }
        }
    }
}
