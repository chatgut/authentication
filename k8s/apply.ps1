minikube kubectl -- apply -f jaegar-kubernetes.yml
minikube kubectl -- apply -f postgres-kubernetes.yml
minikube kubectl -- apply -f frontend-kubernetes.yml
minikube kubectl -- apply -f pwd-hashing-kubernetes.yml
minikube kubectl -- apply -f auth-service-kubernetes.yml
