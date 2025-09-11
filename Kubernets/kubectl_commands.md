# to start minikube in your Desktop/Laptop
# Make sure you have installed minikube and kubectl in your system

```bash
minikube start
```


# to check the status of minikube--
```bash
minikube status
```

# Cluster & Context Info--
```bash
kubectl version                   # Shows kubectl and cluster version
kubectl cluster-info              # Shows cluster URLs and status
kubectl config get-contexts       # Lists all available contexts (clusters)
kubectl config current-context    # Shows which context (cluster) you're currently using
kubectl config use-context <name> # Switch to a different context

🔹 Context means which cluster and namespace your kubectl is connected to.


```


# To know the pods--
```bash
kubectl get pods                  # Shows all pods in the current namespace
kubectl get pods -A               # Shows pods in ALL namespaces
kubectl get pods -o wide          # Shows more details (e.g., node name, IP)
kubectl get pods -o json / -o yaml # Shows output in JSON or YAML format
kubectl get pods -o yaml

kubectl describe pod <pod-name>              # Detailed info about the pod
kubectl logs <pod-name>                      # Shows logs (output) of the pod
kubectl logs <pod-name> -c <container-name>  # Logs for specific container (if multiple)
kubectl exec -it <pod-name> -- /bin/bash     # Opens shell inside the pod (if bash is available)
kubectl delete pod <pod-name>                # Deletes the pod
kubectl delete pod pod1 pod2 pod3
kubectl delete pods --all -n your-namespace


```

# Deployments--
*Deployments Commnads-*
```bash
kubectl get deployments                      # Lists all deployments
kubectl describe deployment <name>           # Detailed deployment info
kubectl apply -f <file.yaml>                 # Creates/updates resources using YAML
kubectl delete deployment <name>             # Deletes the deployment
kubectl scale deployment <name> --replicas=3 # Sets number of pods to 3
kubectl edit deployment <name>               # Opens deployment YAML in editor
kubectl get deployment <name> -o yaml --export  # Export Resource YAML
kubectl patch deployment <name> -p '{"spec":{"replicas":4}}' # Updates using inline patch

```


# Services--
```bash
kubectl get svc                                # Lists all services
kubectl describe svc <name>                    # Detailed service info
kubectl port-forward svc/<service-name> 8080:80
kubectl port-forward pod/<pod-name> 5800:5800 &  # Run in background (&)

🔹 Services allow access to pods from inside or outside the cluster.

```

# Namespaces--
*Namespaces-*
```bash
kubectl get namespaces                                        # List all namespaces
kubectl config set-context --current --namespace=<name>      # Set default namespace
kubectl get all                                               # List all resources in current namespace
kubectl get all -A                                            # List all resources across all namespaces
kubectl get events                                            # View recent events (useful for debugging)
kubectl explain pod                                           # Show structure/schema of a resource
kubectl explain deployment
kubectl explain pod.spec.containers
kubectl explain pod.spec.containers
```


# YAML Files (Apply, Create, Delete)--
*YAML Files (Apply, Create, Delete)-*
- File extension: .yaml or .yml
```bash
kubectl apply -f <file.yaml>                # Create or update resources from YAML
kubectl apply -f app.yaml --dry-run=client  # Test the YAML without applying
kubectl create -f <file.yaml>               # Create new resources from YAML
kubectl delete -f <file.yaml>               # Delete resources using YAML
```

```bash
🔹 Example:
kubectl apply -f deployment.yaml
kubectl create -f deployment.yaml

```


# Port Forwarding & Proxy--
*Port Forwarding & Proxy-*
```bash
kubectl port-forward pod/<pod-name> 8080:80  # Access pod on localhost:8080
kubectl proxy                                # Creates a proxy to access cluster via localhost
```


#  Node & Cluster Resources--
*Node & Cluster Resources-*
```bash
kubectl get nodes                       # Shows all cluster nodes
kubectl describe node <node-name>       # Detailed info about a specific node
kubectl top pod                         # Shows pod resource usage (needs metrics-server)
kubectl top node                        # Shows node CPU & memory usage

```


# Rollouts--
*Rollouts-*
```bash
kubectl rollout status deployment <name>   # Shows rollout progress
kubectl rollout history deployment <name>  # View past versions
kubectl rollout undo deployment <name>     # Rollback to previous version

```


# ConfigMap and Secrets--
*ConfigMap and Secrets-*
```bash
kubectl create configmap my-config --from-literal=key=value     # Create ConfigMap
kubectl get configmap my-config -o yaml                         # View ConfigMap in YAML

kubectl create secret generic my-secret --from-literal=password=admin123
kubectl get secret my-secret -o yaml

🔹 ConfigMaps = normal app configs
🔹 Secrets = encrypted values (like passwords)
```


# Working with Labels & Selectors--
*Working with Labels & Selectors-*
```bash
kubectl get pods --show-labels                  # Show labels of each pod
kubectl get pods -l app=nginx                   # Show pods with specific label
kubectl label pod <pod-name> env=prod           # Add a label to a pod
kubectl delete pod -l app=nginx                 # Delete pods with specific label
```


# Taint and Tolerations (Nodes)--
*Taint and Tolerations (Nodes)-*
```bash
kubectl taint nodes <node-name> key=value:NoSchedule   # Add taint to node
kubectl describe node <node-name>                      # Check taints on node
```

