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
                // sh 'apt-get update && apt-get -y install libgtk2.0-0 libgtk-3-0 libgbm-dev libnotify-dev libgconf-2-4 libnss3 libxss1 libasound2 libxtst6 xauth xvfb'
                // sh "chmod -R +x ./sh_scripts"
                // sh "./sh_scripts/Xvfb-start.sh"
                // sh "apt-get update && apt-get -y install procps"
                // sh "pkill Xvfb"
                sh "npm install cypress@9.7.0 --force"
                sh "npm i --force"
                sh "npm run mochawesome-delete-all"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                // sh "rm -rf /root/.config"
                sh "Xvfb :99 & --disable-gpu-sandbox --disable-gpu"
                sh "export DISPLAY=:99"
                sh "npx cypress run --headless --spec cypress/integration/1-getting-started/todo.spec.js"
                sh "pkill Xvfb"
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