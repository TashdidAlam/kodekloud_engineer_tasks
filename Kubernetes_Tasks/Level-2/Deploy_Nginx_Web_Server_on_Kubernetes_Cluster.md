# Question
Some of the Nautilus team developers are developing a static website and they want to deploy it on Kubernetes cluster. They want it to be highly available and scalable. Therefore, based on the requirements, the DevOps team has decided to create deployment for it with multiple replicas. Below you can find more details about it:

**Create a `deployment` using `nginx image` with latest tag only and remember to mention tag i.e `nginx:latest` and name it as `nginx-deployment`. App labels should be `app: nginx-app` and `type: front-end`. The container should be named as `nginx-container`; also make sure replica counts are `3`.**

**Also create a service named `nginx-service` and type `NodePort`. The targetPort should be `80` and `nodePort` should be `30011`.**

**Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

1. At first  check existing deployment and  pods running status
```bash
    kubectl get namespace
    kubectl get pods
```

2. Create YAML  file with all the parameters

```bash
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
3. Run below command to create pod 

```
kubectl create -f /tmp/nginx.yml
kubectl get pods
```

4. Validate the task by running below command 
```
kubectl exec nginx-deployment-56cdb5d774-49rqs  -- curl http://localhost
```
Click on confirm to complete the task