#!groovy


@Library("boxed-kube-infrastructure") _

node {
    env.APPS = "multi-ping"

    switch (env.BRANCH_NAME) {
        /*case "master":
            kubeContext = 'gke_boxed-api_us-east4_production'
            namespace = 'prod'
            environment = 'prod'
            break */

        case "staging":
            kubeContext = 'gke_boxed-api-staging_us-east4_staging'
            namespace = "staging"
            environment = 'staging'
            break
    }
    setupFreighter()

    stage("multi ping Docker Build") {
        sh("freighter build-and-push deploy/config/multi-ping.config.yml")
    }

    stage("Deploy to ${namespace}") {
        sh("freighter deploy-templates ${env.APPS} -e ${environment} -n ${namespace} -c ${kubeContext}")
    }
}
