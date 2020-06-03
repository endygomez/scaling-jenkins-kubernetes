#!/bin/bash

# delete ingress
kubectl delete -f ci-env/ingress.yaml

# delete deployment
kubectl delete -f jenkins/deployment.yaml

# delete services
kubectl delete -f jenkins/services.yaml

# delete persistent-volume-claim
kubectl delete -f jenkins/persistent-volume-claim.yaml

# delete persistent-volume
kubectl delete -f jenkins/persistent-volume.yaml

# delete namespaces continuous-integration
kubectl delete -f ci-env/namespace.yaml

# delete cluster role binding
kubectl delete clusterrolebinding jenkins