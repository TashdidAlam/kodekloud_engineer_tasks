# Question
The Nautilus DevOps team is going to deploy some applications on kubernetes cluster as they are planning to migrate some of their existing applications there. Recently one of the team members has been assigned a task to write a template as per details mentioned below:

**Create a ReplicaSet using `httpd` image with `latest` tag only and remember to mention tag i.e `httpd:latest` and name it as `httpd-replicaset`.**

**Labels app should be `httpd_app`, labels type should be `front-end`.**

**The container should be named as `httpd-container`; also make sure replicas counts are `4`.**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First Create Replicaset on Jump Host
```
vi httpd-replicaset.yml
```

Add these code in the YAML file
```
apiVersion: apps/v1
kind: ReplicaSet
metadata:
  name: httpd-replicaset
  labels:
    app: httpd_app
    type: front-end
spec:
  replicas: 4
  selector:
    matchLabels:
      app: httpd_app
      type: front-end
  template:
    metadata:
      labels:
        app: httpd_app
        type: front-end
    spec:
      containers:
      - name: httpd-container
        image: httpd:latest
```

Now create the replicaset with this command
```
kubectl apply -f httpd-replicaset.yml
```
Click on confirm to complete the task
