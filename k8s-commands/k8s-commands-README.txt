Here’s a list of commonly used Kubernetes commands with examples. These commands cover a wide range of operations, from deploying applications to managing resources and accessing cluster information.

1. kubectl get – List Resources
Retrieve information about different resources (pods, services, deployments, etc.).

# Get all pods in the current namespace
kubectl get pods

# Get all services in the current namespace
kubectl get svc

# Get all deployments in the current namespace
kubectl get deployments

# Get all namespaces
kubectl get namespaces

# Get all nodes in the cluster
kubectl get nodes
2. kubectl describe – Detailed View of Resources
Displays detailed information about resources.

# Describe a pod
kubectl describe pod <pod-name>

# Describe a service
kubectl describe svc <service-name>

# Describe a deployment
kubectl describe deployment <deployment-name>
3. kubectl logs – View Pod Logs
Get the logs for a specific pod or container.

# Get logs of a specific pod
kubectl logs <pod-name>

# Get logs of a specific container in a pod
kubectl logs <pod-name> -c <container-name>

# Stream logs of a running pod
kubectl logs -f <pod-name>
4. kubectl exec – Run Commands in a Pod
Execute commands inside a running pod's container.

# Run a command in a pod (useful for debugging)
kubectl exec -it <pod-name> -- <command>

# Example: open a shell inside a container
kubectl exec -it <pod-name> -- /bin/bash
5. kubectl create – Create Resources
Create Kubernetes resources from files or directly using commands.

# Create a deployment from a YAML file
kubectl create -f deployment.yaml

# Create a pod
kubectl run nginx --image=nginx

# Create a service
kubectl expose pod nginx --port=80 --target-port=80
6. kubectl apply – Apply Changes to Resources
Apply a configuration to a resource using a file (used for creating and updating resources).

# Apply changes from a YAML file
kubectl apply -f deployment.yaml
7. kubectl delete – Delete Resources
Remove resources from the cluster.

# Delete a pod
kubectl delete pod <pod-name>

# Delete a deployment
kubectl delete deployment <deployment-name>

# Delete all pods in a namespace
kubectl delete pods --all

# Delete resources from a YAML file
kubectl delete -f deployment.yaml
8. kubectl scale – Scale a Deployment
Scale the number of replicas for a deployment.

# Scale a deployment to 3 replicas
kubectl scale deployment <deployment-name> --replicas=3
9. kubectl edit – Edit a Resource in Place
Modify the resource’s YAML file in place.

# Edit a running deployment
kubectl edit deployment <deployment-name>

# Edit a configmap
kubectl edit configmap <configmap-name>
10. kubectl port-forward – Forward Local Ports to a Pod
Access a service running in a pod by forwarding ports to your local machine.

# Forward local port 8080 to port 80 of the pod
kubectl port-forward pod/<pod-name> 8080:80
11. kubectl rollout – Manage Rollouts for a Deployment
Control the rollout of a deployment (check status, pause, resume, etc.).

# Check the status of a rollout
kubectl rollout status deployment <deployment-name>

# Pause a rollout
kubectl rollout pause deployment <deployment-name>

# Resume a rollout
kubectl rollout resume deployment <deployment-name>

# Rollback to a previous version
kubectl rollout undo deployment <deployment-name>
12. kubectl expose – Expose a Resource as a Service
Expose a pod or deployment as a service to make it accessible within or outside the cluster.

# Expose a deployment as a service
kubectl expose deployment <deployment-name> --type=LoadBalancer --port=80 --target-port=8080
13. kubectl top – View Resource Usage (CPU/Memory)
Display resource usage statistics for nodes or pods.

# Show resource usage for nodes
kubectl top nodes

# Show resource usage for pods
kubectl top pods
14. kubectl config – Configure Access to the Cluster
Set or view the configuration for accessing different clusters.

# View the current context
kubectl config current-context

# List all available contexts
kubectl config get-contexts

# Switch to a different context
kubectl config use-context <context-name>

# View the current configuration
kubectl config view
15. kubectl get events – View Cluster Events
Displays events happening in the cluster.

# Get all events in the default namespace
kubectl get events

# Get all events in all namespaces
kubectl get events --all-namespaces
16. kubectl apply --dry-run – Test Your Configurations
Test the YAML file before actually applying the changes to the cluster.

# Dry run a deployment
kubectl apply -f deployment.yaml --dry-run=client
17. kubectl label – Add or Update Labels
Label resources in the cluster.

# Add a label to a pod
kubectl label pod <pod-name> environment=production
18. kubectl annotate – Add or Update Annotations
Annotations can be used for non-identifying metadata.

# Annotate a pod
kubectl annotate pod <pod-name> description="This is my app"
19. kubectl patch – Update Part of a Resource
Use patch to update a part of the resource without modifying the full YAML.

# Patch a deployment's replica count
kubectl patch deployment <deployment-name> -p '{"spec": {"replicas": 3}}'
20. kubectl cp – Copy Files to and from Containers
Transfer files between your local system and the pod’s container.

# Copy a file from your local system to the container
kubectl cp ./local-file.txt <pod-name>:/path/in/container

# Copy a file from the container to your local system
kubectl cp <pod-name>:/path/in/container ./local-file.txt
These commands cover a wide range of typical Kubernetes tasks, from deploying and scaling applications to managing and troubleshooting resources.

