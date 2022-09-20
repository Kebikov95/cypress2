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
                bat "npm run mochawesome-delete-all"
                bat "npm i"
            }
        }
        stage('Testing') {
            steps {
                echo "Test the application"
                bat "npx cypress run --spec ${SPEC} --browser ${BROWSER}"
            }
        }
        stage('Report') {
            steps {
                echo "Create the report about tests"
                bat "npm run mochawesome-merge"
            }
        }
    }

    // post {
    //     always {
    //         publishHTML target: [
    //         allowMissing: false,
    //         alwaysLinkToLastBuild: false,
    //         keepAll: true,
    //         reportDir: 'mochawesome-report',
    //         reportFiles: 'mochawesome.html',
    //         reportName: 'Mochawesome Report']
    //     }
    // }
}