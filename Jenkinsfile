pipeline {

    agent any

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/integration/**/*.js", description: "Enter script to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'edge', 'firefox'])
        choice(name: 'ENV', choices: ['stage', 'prod'])
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the application"
                sh "npx i"
                sh "npx run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                sh "npx cypress run --spec ${SPEC} --browser ${BROWSER}"
            }
        }
        stage('Report') {
            steps {
                echo "Create the report about tests"
                sh "npx run mochawesome-merge"
            }
        }
    }
}