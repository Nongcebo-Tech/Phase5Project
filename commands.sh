# Set of commands to run the demo

# Looking at the cluster
kubectl get nodes
kubectl get nodes -n kube-system

# Running a single Pod
kubectl apply -f k8s/deployment.yml
kubectl get pods 
kubectl get services
kubectl get services CICD-Demo-Service -o wide
kubectl get deployments CICD-Demo-Deployment -o wide
minikube service CICD-Demo-Service

#Running a deployment
#window 1
watch -n1 kubectl get pods
kubectl scale CICD-Demo-Deployment --replicas=3

#window 2
kubectl get events --watch

#window 3
while true ; do curl -s 192.168.99.100:30373/ | jq ".hostname" ; done

#window 4
kubectl scale deployment CICD-Demo-Deployment --replicas=2
kubectl set image  deployment/CICD-Demo-Deployment cicd-demo-app=helderklemp/cicd-demo:42
kubectl rollout undo deployment CICD-Demo-Deployment



