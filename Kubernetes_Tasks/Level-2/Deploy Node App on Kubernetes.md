# Question
The Nautilus development team has completed development of one of the node applications which they are planning deploy on a Kubernetes cluster. They recently had a meeting with the DevOps team to share their requirements. Based on the DevOps team has listed out the exact requirement to setup the cluster the same way. Fine below more details:

Create a namespace named node-namespace-nautilus.

Create a deployment named node-deployment-nautilus under this new namespace. Replica count should be 2, container should be named as node-container-nautilus, use gcr.io/kodekloud/centos-ssh-enabled:node image and container port should be 80.

Create a service named node-service-nautilus. Service type should be NodePort, target port should be 8080, port should be 80 and nodePort should be 30012.

Make sure all pods are in Running state after the deployment.

You can check the application page by clicking on + button on top left corner and clicking on Select port to view on Host 1, then enter your nodePort.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create a new namespace 
```
kubectl create namespace node-namespace-nautilus
```


```
apiVersion: v1
kind: Service
metadata:
  name: node-service-nautilus
  namespace: node-namespace-nautilus
spec:
  type: NodePort
  selector:
    app: node-app-datacenter
  ports:
    - port: 80
      targetPort: 8080
      nodePort: 30012
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: node-deployment-nautilus
  namespace: node-namespace-nautilus
spec:
  replicas: 2
  selector:
    matchLabels:
      app: node-app-datacenter
  template:
    metadata:
      labels:
        app: node-app-datacenter
    spec:
      containers:
        - name: node-container-nautilus
          image: gcr.io/kodekloud/centos-ssh-enabled:node
          ports:
            - containerPort: 80

```

Run the below command to create a pod
```
 kubectl create -f /tmp/node.yaml
```
Validate the task seeing the application then
Click on confirm to complete the task
