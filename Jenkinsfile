pipeline {
    agent any

    environment {
        VIRTUAL_ENV = 'venv'  // Define virtual environment name
    }

    stages {
        stage('Setup') {
            steps {
                script {
                    // Check if the virtual environment folder exists, if not, create it
                    if (!fileExists("${env.WORKSPACE}\\${VIRTUAL_ENV}")) {
                        bat "python -m venv ${VIRTUAL_ENV}"  // Create virtual environment
                    }
                    // Activate the virtual environment and install required packages from requirements.txt
                    bat "call ${VIRTUAL_ENV}\\Scripts\\activate && pip install -r requirements.txt"
                }
            }
        }

        stage('Lint') {
            steps {
                script {
                    // Run flake8 to lint the code
                    bat "call ${VIRTUAL_ENV}\\Scripts\\activate && flake8 app.py"
                }
            }
        }

        stage('Test') {
            steps {
                script {
                    // Ensure we're in the correct working directory before running tests
                    bat """
                        cd ${env.WORKSPACE}  # Go to the root directory
                        call ${VIRTUAL_ENV}\\Scripts\\activate
                        set PYTHONPATH=%CD% 
                        pytest tests\\test_app.py -v --tb=short
                    """
                }
            }
        }

        stage('Coverage') {
            steps {
                script {
                    // Run coverage to track test coverage
                    bat """
                        call ${VIRTUAL_ENV}\\Scripts\\activate
                        coverage run -m pytest tests\\test_app.py
                        coverage report  
                    """
                }
            }
        }

        stage('Security Scan') {
            steps {
                script {
                    // Run bandit to check for security vulnerabilities
                    bat "call ${VIRTUAL_ENV}\\Scripts\\activate && bandit -r app.py"
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    echo "Deploying application..."
                    //local deployment
                    bat 'deploy.bat' 
                }
            }
        }
    }

    post {
        always {
            // Clean up the workspace after each run to free resources
            cleanWs()
        }
    }
}
