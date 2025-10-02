# Question
Some of the Nautilus team developers are developing a static website and they want to deploy it on Kubernetes cluster. They want it to be highly available and scalable. Therefore, based on the requirements, the DevOps team has decided to create deployment for it with multiple replicas. Below you can find more details about it:

**Create a `deployment` using `nginx image` with latest tag only and remember to mention tag i.e `nginx:latest` and name it as `nginx-deployment`. App labels should be `app: nginx-app` and `type: front-end`. The container should be named as `nginx-container`; also make sure replica counts are `3`.**

**Also create a service named `nginx-service` and type `NodePort`. The targetPort should be `80` and `nodePort` should be `30011`.**

**Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>


---

## Step-by-Step Solution

**Step 1: Check existing deployments and pods**

- List all namespaces and pods to confirm the cluster is ready and see current resources:

```bash
kubectl get namespace
kubectl get pods
```
> *Shows all namespaces and pods in the cluster, allowing you to verify the environment before deploying.*

---

**Step 2: Create the YAML manifest for the deployment and service**

- Use a text editor to create the manifest file with all required parameters:

```bash
vi /tmp/nginx.yml
```
> *Opens the file `/tmp/nginx.yml` for editing. Paste the following manifest and save the file:*

```yaml
apiVersion: v1
kind: Service
metadata:
  name: nginx-service
spec:
  type: NodePort
  selector:
    app: nginx-app
    type: front-end
  ports:
    - port: 80
      targetPort: 80
      nodePort: 30011
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: nginx-deployment
  labels:
    app: nginx-app
    type: front-end
spec:
  replicas: 3
  selector:
    matchLabels:
      app: nginx-app
      type: front-end
  template:
    metadata:
      labels:
        app: nginx-app
        type: front-end
    spec:
      containers:
        - name: nginx-container
          image: nginx:latest
```
---

**Step 3: Create the deployment and service using kubectl**

- Apply the manifest to create the resources:

```bash
kubectl create -f /tmp/nginx.yml
kubectl get pods
```
> *Creates the deployment and service in the cluster, then lists pods to confirm they are running.*

---

**Step 4: Validate the deployment**

- Exec into one of the running pods to test the web server:

```bash
kubectl exec <nginx-pod-name> -- curl http://localhost
```
> *Runs a curl command inside the nginx pod to verify the web server is serving content. Replace `<nginx-pod-name>` with the actual pod name from `kubectl get pods` output.*