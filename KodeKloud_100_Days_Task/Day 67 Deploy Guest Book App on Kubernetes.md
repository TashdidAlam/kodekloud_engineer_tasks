# Question
The Nautilus Application development team has finished development of one of the applications and it is ready for deployment. It is a guestbook application that will be used to manage entries for guests/visitors. As per discussion with the DevOps team, they have finalized the infrastructure that will be deployed on Kubernetes cluster. Below you can find more details about it.


BACK-END TIER

Create a deployment named redis-master for Redis master.

a.) Replicas count should be 1.

b.) Container name should be master-redis-xfusion and it should use image redis.

c.) Request resources as CPU should be 100m and Memory should be 100Mi.

d.) Container port should be redis default port i.e 6379.

Create a service named redis-master for Redis master. Port and targetPort should be Redis default port i.e 6379.

Create another deployment named redis-slave for Redis slave.

a.) Replicas count should be 2.

b.) Container name should be slave-redis-xfusion and it should use gcr.io/google_samples/gb-redisslave:v3 image.

c.) Requests resources as CPU should be 100m and Memory should be 100Mi.

d.) Define an environment variable named GET_HOSTS_FROM and its value should be dns.

e.) Container port should be Redis default port i.e 6379.

Create another service named redis-slave. It should use Redis default port i.e 6379.

FRONT END TIER

Create a deployment named frontend.

a.) Replicas count should be 3.

b.) Container name should be php-redis-xfusion and it should use gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff image.

c.) Request resources as CPU should be 100m and Memory should be 100Mi.

d.) Define an environment variable named as GET_HOSTS_FROM and its value should be dns.

e.) Container port should be 80.

Create a service named frontend. Its type should be NodePort, port should be 80 and its nodePort should be 30009.

Finally, you can check the guestbook app by clicking on App button.


You can use any labels as per your choice.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

---
### Step-by-Step Deployment Guide

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

#### Step 1: Prepare the Manifest File
**Reason:** Defining all resources (deployments and services for backend and frontend) in a single YAML file ensures everything is created together and is easy to manage and reproduce.

Create a file named `guestbook-app.yaml` and paste the following manifest:

```yaml
# ============================
# Redis Master Deployment
# ============================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-master
  labels:
    app: redis
    tier: backend
    role: master
spec:
  replicas: 1
  selector:
    matchLabels:
      app: redis
      role: master
  template:
    metadata:
      labels:
        app: redis
        role: master
    spec:
      containers:
      - name: master-redis-xfusion
        image: redis
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        ports:
        - containerPort: 6379
---
# ============================
# Redis Master Service
# ============================
apiVersion: v1
kind: Service
metadata:
  name: redis-master
  labels:
    app: redis
    role: master
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis
    role: master
---
# ============================
# Redis Slave Deployment
# ============================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: redis-slave
  labels:
    app: redis
    tier: backend
    role: slave
spec:
  replicas: 2
  selector:
    matchLabels:
      app: redis
      role: slave
  template:
    metadata:
      labels:
        app: redis
        role: slave
    spec:
      containers:
      - name: slave-redis-xfusion
        image: gcr.io/google_samples/gb-redisslave:v3
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 6379
---
# ============================
# Redis Slave Service
# ============================
apiVersion: v1
kind: Service
metadata:
  name: redis-slave
  labels:
    app: redis
    role: slave
spec:
  ports:
  - port: 6379
    targetPort: 6379
  selector:
    app: redis
    role: slave
---
# ============================
# Frontend Deployment
# ============================
apiVersion: apps/v1
kind: Deployment
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  replicas: 3
  selector:
    matchLabels:
      app: guestbook
      tier: frontend
  template:
    metadata:
      labels:
        app: guestbook
        tier: frontend
    spec:
      containers:
      - name: php-redis-xfusion
        image: gcr.io/google-samples/gb-frontend@sha256:a908df8486ff66f2c4daa0d3d8a2fa09846a1fc8efd65649c0109695c7c5cbff
        resources:
          requests:
            cpu: 100m
            memory: 100Mi
        env:
        - name: GET_HOSTS_FROM
          value: dns
        ports:
        - containerPort: 80
---
# ============================
# Frontend Service
# ============================
apiVersion: v1
kind: Service
metadata:
  name: frontend
  labels:
    app: guestbook
    tier: frontend
spec:
  type: NodePort
  ports:
  - port: 80
    targetPort: 80
    nodePort: 30009
  selector:
    app: guestbook
    tier: frontend
```

#### Step 2: Save the Manifest
**Reason:** Saving the manifest allows you to apply all resources at once and keep your configuration versioned.

```bash
vi guestbook-app.yaml
```
Paste the above YAML, then save and exit.

#### Step 3: Apply the Manifest
**Reason:** This command creates all defined resources (deployments and services) in the cluster.

```bash
kubectl apply -f guestbook-app.yaml
```

#### Step 4: Verify Resources
**Reason:** Ensures that all resources are created and running as expected.

```bash
kubectl get all
```
You should see Deployments: redis-master, redis-slave, frontend; Services: redis-master, redis-slave, frontend; and all pods running and ready.

#### Step 5: Access the App
**Reason:** To confirm the frontend is accessible and the guestbook app is working.

Click on the app icon (if available) or access the app using the NodePort on the cluster node's IP.

---

**Note:**
- The `kubectl` command is already configured on the jump host for this cluster.
