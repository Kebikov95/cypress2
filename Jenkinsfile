pipeline {

    agent any

    tools {nodejs "node"}

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/integration/1-getting-started/*.spec.js", description: "Enter script to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'edge', 'firefox'])
        choice(name: 'ENV', choices: ['stage', 'prod'])
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the application"
                sh 'DISPLAY=:0'
                sh 'apt-get update && apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb'
                sh "npm install cypress@9.7.0 --force"
                sh "npm i --force"
                sh "npm run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                sh "npx cypress run --headless --spec cypress/integration/1-getting-started/*.js"
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