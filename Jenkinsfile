pipeline {

    agent any

    tools {
        node '18.9.0'
    }

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/integration/**/*.js", description: "Enter script to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'edge', 'firefox'])
        choice(name: 'ENV', choices: ['stage', 'prod'])
    }

    stages {
        stage('Build') {
            agent {
                docker {
                    image 'node:14-buster'
                }
            }
            steps {
                echo "Building the application"
                sh "npm i"
                sh "npm run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                sh "npm cypress run --spec ${SPEC} --browser ${BROWSER}"
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