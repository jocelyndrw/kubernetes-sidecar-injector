#!/usr/bin/env bash
make docker

docker run -d --name injector -p 8443:443 --mount type=bind,src=${GOPATH}/src/github.com/expediadotcom/kubernetes-sidecar-injector/sample,dst=/etc/mutator expediadotcom/kubernetes-sidecar-injector:latest -logtostderr

docker logs -f $(docker ps -f name=injector -q)

