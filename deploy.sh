#!/bin/bash

# create namespace
kubectl apply -f ci-env/namespace.yaml

# create certificate
kubectl create secret tls jenkins-dev-certificate --key jenkins/certificate/jenkins.localhost.dev+4-key.pem --cert jenkins/certificate/jenkins.localhost.dev+4.pem -n ci

# create persistent volume and persistent volume claim
kubectl apply -f jenkins/persistent-volume.yaml
kubectl apply -f jenkins/persistent-volume-claim.yaml

# create services ui and discovery
kubectl apply -f jenkins/services.yaml

# create deployment
kubectl apply -f jenkins/deployment.yaml

# create ingress for continuous integration tools
kubectl apply -f ci-env/ingress.yaml

# create clusterrolebinding
kubectl create clusterrolebinding jenkins --clusterrole cluster-admin --serviceaccount=ci:default