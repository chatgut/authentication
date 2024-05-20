#!/bin/bash

minikube kubectl -- delete -f jaegar-kubernetes.yml
minikube kubectl -- delete -f postgres-kubernetes.yml
minikube kubectl -- delete -f frontend-kubernetes.yml
minikube kubectl -- delete -f pwd-hashing-kubernetes.yml
minikube kubectl -- delete -f auth-service-kubernetes.yml
