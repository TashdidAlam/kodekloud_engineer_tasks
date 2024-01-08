# Question
The Nautilus DevOps team is working on setting up some pre-requisites for an application that will send greetings to different users. There is a sample deployment that needs to be tested. Below is a scenario which needs to be configured on Kubernetes cluster. Please find below more details about it.

Create a pod named print-envars-greeting.

Configure spec as the container name should be print-env-container and use bash image.

Create three env vars

a. GREETING and its value should be Welcome to

b. COMPANY and its value should be Stratos

c. GROUP and its value should be Group

Use command echo and configure args as ["$(GREETING) $(COMPANY) $(GROUP)"].

You can check the output by using <kubctl logs -f [ pod-name ]> command.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

At first  check existing deployment and  pods running status
```
kubectl get pods
```
Create yaml file with all the parameters

```
vi /tmp/env.yml

apiVersion: v1

kind: Pod

metadata:

  name: print-envars-greeting

  labels:

    name: print-envars-greeting

spec:

  containers:

    - name: print-env-container

      image: bash

      env:

        - name: GREETING

          value: "Welcome to"

        - name: COMPANY

          value: "Stratos"

        - name: GROUP

          value: "Group"

      command: ["echo"]

      args: ["$(GREETING) $(COMPANY) $(GROUP)"]
```

Run below command to create pod
```
kubectl create -f /tmp/env.yml
```
Wait for pods to get running status then Validate the task by running below command
```
kubectl logs print-envars-greeting
``` 
Click on confirm to complete the task

