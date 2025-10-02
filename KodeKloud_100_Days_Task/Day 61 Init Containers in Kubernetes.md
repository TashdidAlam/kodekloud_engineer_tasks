# Question
There are some applications that need to be deployed on Kubernetes cluster and these apps have some pre-requisites where some configurations need to be changed before deploying the app container. Some of these changes cannot be made inside the images so the DevOps team has come up with a solution to use init containers to perform these tasks during deployment. Below is a sample scenario that the team is going to test first.

Create a Deployment named as ic-deploy-devops.

Configure spec as replicas should be 1, labels app should be ic-devops, template's metadata labels app should be the same ic-devops.

The initContainers should be named as ic-msg-devops, use image ubuntu with latest tag and use command '/bin/bash', '-c' and 'echo Init Done - Welcome to xFusionCorp Industries > /ic/news'. The volume mount should be named as ic-volume-devops and mount path should be /ic.

Main container should be named as ic-main-devops, use image ubuntu with latest tag and use command '/bin/bash', '-c' and 'while true; do cat /ic/news; sleep 5; done'. The volume mount should be named as ic-volume-devops and mount path should be /ic.

Volume to be named as ic-volume-devops and it should be an emptyDir type.

Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

---

## Step-by-Step Solution

**Step 1: Create the Deployment YAML**

- Use a text editor to create the deployment manifest file:

```bash
vi ic-deploy-devops.yaml
```
> *Opens the file `ic-deploy-devops.yaml` for editing. Paste the following manifest and save the file:*

```yaml
apiVersion: apps/v1
kind: Deployment
metadata:
  name: ic-deploy-devops
spec:
  replicas: 1
  selector:
    matchLabels:
      app: ic-devops
  template:
    metadata:
      labels:
        app: ic-devops
    spec:
      initContainers:
      - name: ic-msg-devops
        image: ubuntu:latest
        command: ["/bin/bash", "-c", "echo Init Done - Welcome to xFusionCorp Industries > /ic/news"]
        volumeMounts:
        - name: ic-volume-devops
          mountPath: /ic
      containers:
      - name: ic-main-devops
        image: ubuntu:latest
        command: ["/bin/bash", "-c", "while true; do cat /ic/news; sleep 5; done"]
        volumeMounts:
        - name: ic-volume-devops
          mountPath: /ic
      volumes:
      - name: ic-volume-devops
        emptyDir: {}
```
---

**Step 2: Apply the Deployment**

- Use kubectl to apply the deployment manifest:

```bash
kubectl apply -f ic-deploy-devops.yaml
```
> *Creates the deployment and all associated resources in the cluster.*

---

**Step 3: Verify Deployment & Pod**

- Check the status of the deployment and pod:

```bash
kubectl get deployments
kubectl get pods
```
> *Verifies that the deployment and pod are created and running.*

---

**Step 4: Check Logs of the Running Pod**

- View the logs from the running pod to confirm the init container's message is being printed:

```bash
kubectl logs -f <pod-name>
```
> *Shows the output from the main container, which should repeat the message written by the init container every 5 seconds.*