pipeline {

    agent any

    tools {nodejs "node"}

    parameters {
        string(name: 'SPEC', defaultValue: "cypress/integration/1-getting-started/todo.spec.js", description: "Enter script to execute")
        choice(name: 'BROWSER', choices: ['chrome', 'electron', 'edge', 'firefox'])
        choice(name: 'ENV', choices: ['stage', 'prod'])
    }

    stages {
        stage('Build') {
            steps {
                echo "Building the application"
                sh "yum install -y xorg-x11-server-Xvfb gtk2-devel gtk3-devel libnotify-devel GConf2 nss libXScrnSaver alsa-lib"
                sh "npm install cypress@9.7.0 --force"
                sh "npm i --force"
                sh "npm run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                sh "npx cypress run --headless --spec cypress/integration/2-advanced-examples/actions.spec.js"
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