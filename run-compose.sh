#!/bin/bash

set -ex

# create grafana fs structure for data persistency
create_fs_structure() {
        #nexus
        mkdir -p ./nexus-data
        sudo chown -R 200 nexus-data

}

# run compose
run_compose() {

        docker-compose up -d

}

#install docker in jenkins
install_docker_in_jenkins() {

        docker exec -it -u root jenkins bash -c '/var/jenkins_home/install-docker.sh'
}

create_fs_structure
run_compose
install_docker_in_jenkins

exit 0

