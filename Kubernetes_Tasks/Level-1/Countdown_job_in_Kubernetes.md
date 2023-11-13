# Countdown job in Kubernetes

## Question
The Nautilus DevOps team is working on to create few jobs in Kubernetes cluster. They might come up with some real scripts/commands to use, but for now they are preparing the templates and testing the jobs with dummy commands. Please create a job template as per details given below:

**Create a job `countdown-datacenter`.**

**The `spec` template should be named as `countdown-datacenter` (under metadata), and the container should be named as `container-countdown-datacenter`**

**Use image `ubuntu` with `latest` tag only and remember to mention tag i.e `ubuntu:latest`, and restart policy should be `Never`.**

**Use `command sleep 5`**

**Note: The `kubectl` utility on `jump_host` has been configured to work with the kubernetes cluster.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

First create a yml file for the countdown of datacenter

```
vi countdown-datacenter.yml
```
Add these codes in that yml file

```
apiVersion: batch/v1
kind: Job
metadata:
  name: countdown-datacenter
spec:
  template:
    metadata:
      name: countdown-datacenter
    spec:
      containers:
      - name: container-countdown-datacenter
        image: ubuntu:latest
        command: ["sleep", "5"]
      restartPolicy: Never
```

Now apply the yml file

```
kubectl apply -f countdown-datacenter.yml
```

Check the pods for confirmation

```
kubectl get pods
```
Click on confirm to complete the task