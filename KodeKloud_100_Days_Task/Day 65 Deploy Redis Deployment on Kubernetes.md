## Day 65: Deploy Redis Deployment on Kubernetes

**Question:**
The Nautilus application development team observed some performance issues with one of the application that is deployed in Kubernetes cluster. After looking into number of factors, the team has suggested to use some in-memory caching utility for DB service. After number of discussions, they have decided to use Redis. Initially they would like to deploy Redis on kubernetes cluster for testing and later they will move it to production. Please find below more details about the task:


Create a redis deployment with following parameters:

Create a config map called my-redis-config having maxmemory 2mb in redis-config.

Name of the deployment should be redis-deployment, it should use
redis:alpine image and container name should be redis-container. Also make sure it has only 1 replica.

The container should request for 1 CPU.

Mount 2 volumes:

a. An Empty directory volume called data at path /redis-master-data.

b. A configmap volume called redis-config at path /redis-master.

c. The container should expose the port 6379.

Finally, redis-deployment should be in an up and running state.
Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.


---
### Step-by-Step Deployment Guide

#### Step 1: Prepare the Manifest File
**Reason:** Defining both the ConfigMap and Deployment in a single YAML file ensures all required resources are created together and are easy to manage.

Create a file named `redis-deployment.yaml` and paste the following manifest:

```yaml
apiVersion: v1
kind: ConfigMap
metadata:
  name: my-redis-config
data:
  redis-config: |
    maxmemory 2mb
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-deployment
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
  template:
    metadata:
      labels:
        app: redis
    spec:
      containers:
      - name: redis-container
        image: redis:alpine
        resources:
          requests:
            cpu: "1"
        ports:
        - containerPort: 6379
        volumeMounts:
        - name: data
          mountPath: /redis-master-data
        - name: redis-config
          mountPath: /redis-master
      volumes:
      - name: data
        emptyDir: {}
      - name: redis-config
        configMap:
          name: my-redis-config
```

#### Step 2: Save the Manifest
**Reason:** Saving the manifest allows you to apply all resources at once and keep your configuration versioned.

```bash
vi redis-deployment.yaml
```
Paste the above YAML, then save and exit.

#### Step 3: Apply the Manifest
**Reason:** This command creates both the ConfigMap and the Deployment in the cluster.

```bash
kubectl apply -f redis-deployment.yaml
```

#### Step 4: Verify the Deployment and Pods
**Reason:** Ensures that the Redis deployment is up and running and the pod is created successfully.

```bash
kubectl get deploy redis-deployment
```
Shows the status of the deployment.

```bash
kubectl get pods -l app=redis
```
Lists pods created by the deployment, filtered by label.

---


