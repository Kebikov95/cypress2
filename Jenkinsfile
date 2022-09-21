pipeline {

    agent any

    tools {nodejs "node"}

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/integration/**/*.js", description: "Enter script to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'edge', 'firefox'])
        choice(name: 'ENV', choices: ['stage', 'prod'])
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the application"
                sh "npm install cypress@9.7.0"
                sh "npm i"
                sh "npm run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                sh "cypress install"
                sh "npx cypress run --browser ${BROWSER} --spec ${SPEC}"
            }
        }
        stage('Report') {
            steps {
                echo "Create the report about tests"
                sh "npm run mochawesome-merge"
            }
        }
    }
}