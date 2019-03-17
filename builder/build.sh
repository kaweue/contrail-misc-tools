#!/bin/bash

rm -rf contrail-dev-env
sudo docker rm -f $(sudo docker ps -a -q)
sudo docker image rm $(sudo docker images -q)
sudo docker volume rm $(sudo docker volume ls -q)

git clone https://github.com/Juniper/contrail-dev-env
sudo ./contrail-dev-env/startup.sh
sudo docker exec contrail-developer-sandbox make -C contrail-dev-env sync
sudo docker exec contrail-developer-sandbox bash -c 'cd contrail && repo forall -c git checkout R6.0-WIP 2>/dev/null'
sudo docker exec contrail-developer-sandbox make -C contrail-dev-env fetch_packages setup dep rpm
sudo docker exec contrail-developer-sandbox make -C contrail-dev-env container-prepare
sudo docker exec contrail-developer-sandbox bash -c 'cd src/review.opencontrail.org/Juniper/contrail-container-builder/ && git fetch https://github.com/Fenthick/contrail-container-builder.git etcd-envs && git checkout FETCH_HEAD'
sudo docker exec contrail-developer-sandbox make -C contrail-dev-env container-general-base container-base container-controller_config_base container-controller_config_schema container-controller_config_svcmonitor container-kubernetes_kube-manager