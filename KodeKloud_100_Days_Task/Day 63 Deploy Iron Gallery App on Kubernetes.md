## Deploy Iron Gallery App on Kubernetes

**Question:**
There is an iron gallery app that the Nautilus DevOps team was developing. They have recently customized the app and are going to deploy the same on the Kubernetes cluster. Below you can find more details:


Create a namespace iron-namespace-xfusion

Create a deployment iron-gallery-deployment-xfusion for iron gallery under the same namespace you created.

:- Labels run should be iron-gallery.

:- Replicas count should be 1.

:- Selector's matchLabels run should be iron-gallery.

:- Template labels run should be iron-gallery under metadata.

:- The container should be named as iron-gallery-container-xfusion, use kodekloud/irongallery:2.0 image ( use exact image name / tag ).

:- Resources limits for memory should be 100Mi and for CPU should be 50m.

:- First volumeMount name should be config, its mountPath should be /usr/share/nginx/html/data.

:- Second volumeMount name should be images, its mountPath should be /usr/share/nginx/html/uploads.

:- First volume name should be config and give it emptyDir and second volume name should be images, also give it emptyDir.

Create a deployment iron-db-deployment-xfusion for iron db under the same namespace.

:- Labels db should be mariadb.

:- Replicas count should be 1.

:- Selector's matchLabels db should be mariadb.

:- Template labels db should be mariadb under metadata.

:- The container name should be iron-db-container-xfusion, use kodekloud/irondb:2.0 image ( use exact image name / tag ).

:- Define environment, set MYSQL_DATABASE its value should be database_web, set MYSQL_ROOT_PASSWORD and MYSQL_PASSWORD value should be with some complex passwords for DB connections, and MYSQL_USER value should be any custom user ( except root ).

:- Volume mount name should be db and its mountPath should be /var/lib/mysql. Volume name should be db and give it an emptyDir.

Create a service for iron db which should be named iron-db-service-xfusion under the same namespace. Configure spec as selector's db should be mariadb. Protocol should be TCP, port and targetPort should be 3306 and its type should be ClusterIP.

Create a service for iron gallery which should be named iron-gallery-service-xfusion under the same namespace. Configure spec as selector's run should be iron-gallery. Protocol should be TCP, port and targetPort should be 80, nodePort should be 32678 and its type should be NodePort.


Note:


We don't need to make connection b/w database and front-end now, if the installation page is coming up it should be enough for now.

The kubectl on jump_host has been configured to work with the kubernetes cluster.

---
### Step-by-Step Deployment Guide

#### Step 1: Prepare the Manifest File
**Reason:** All resources (namespace, deployments, services) are defined in a single YAML manifest for easy management and reproducibility.

Create a file named `iron-gallery-db.yaml` and paste the following manifest:

```yaml
apiVersion: v1
kind: Namespace
metadata:
  name: iron-namespace-xfusion
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: iron-gallery-deployment-xfusion
  namespace: iron-namespace-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      run: iron-gallery
  template:
    metadata:
      labels:
        run: iron-gallery
    spec:
      containers:
      - name: iron-gallery-container-xfusion
        image: kodekloud/irongallery:2.0
        resources:
          limits:
            memory: "100Mi"
            cpu: "50m"
        volumeMounts:
        - name: config
          mountPath: /usr/share/nginx/html/data
        - name: images
          mountPath: /usr/share/nginx/html/uploads
      volumes:
      - name: config
        emptyDir: {}
      - name: images
        emptyDir: {}
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: iron-db-deployment-xfusion
  namespace: iron-namespace-xfusion
spec:
  replicas: 1
  selector:
    matchLabels:
      db: mariadb
  template:
    metadata:
      labels:
        db: mariadb
    spec:
      containers:
      - name: iron-db-container-xfusion
        image: kodekloud/irondb:2.0
        env:
        - name: MYSQL_DATABASE
          value: database_web
        - name: MYSQL_ROOT_PASSWORD
          value: "RootPass@123"
        - name: MYSQL_USER
          value: "appuser"
        - name: MYSQL_PASSWORD
          value: "UserPass@123"
        volumeMounts:
        - name: db
          mountPath: /var/lib/mysql
      volumes:
      - name: db
        emptyDir: {}
---
apiVersion: v1
kind: Service
metadata:
  name: iron-db-service-xfusion
  namespace: iron-namespace-xfusion
spec:
  type: ClusterIP
  selector:
    db: mariadb
  ports:
  - protocol: TCP
    port: 3306
    targetPort: 3306
---
apiVersion: v1
kind: Service
metadata:
  name: iron-gallery-service-xfusion
  namespace: iron-namespace-xfusion
spec:
  type: NodePort
  selector:
    run: iron-gallery
  ports:
  - protocol: TCP
    port: 80
    targetPort: 80
    nodePort: 32678
```

#### Step 2: Save the Manifest
**Reason:** Saving the manifest allows you to apply all resources at once.

```bash
vi iron-gallery-db.yaml
```
Paste the above YAML, then save and exit.

#### Step 3: Apply the Manifest
**Reason:** This command creates all defined resources (namespace, deployments, services) in the cluster.

```bash
kubectl apply -f iron-gallery-db.yaml
```

#### Step 4: Verify Deployments
**Reason:** Ensures that both deployments (app and DB) are running as expected in the correct namespace.

```bash
kubectl get deployments -n iron-namespace-xfusion
```

#### Step 5: Verify Pods
**Reason:** Confirms that the pods for both deployments are up and running.

```bash
kubectl get pods -n iron-namespace-xfusion
```

#### Step 6: Verify Services
**Reason:** Checks that both services (DB and app) are created and exposed with correct ports and types.

```bash
kubectl get svc -n iron-namespace-xfusion
```

#### Step 7: Access the Iron Gallery App
**Reason:** The app should be accessible via the NodePort service. If the installation page loads, the deployment is successful.

You can access the app by clicking the app button on the top right corner of the interface (if available).

---

**Note:**
- No need to connect the database and front-end for now; just ensure the installation page appears.
- The `kubectl` command is already configured on the jump host for this cluster.
