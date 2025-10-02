# Question
The Nautilus DevOps teams is planning to set up a Grafana tool to collect and analyze analytics from some applications. They are planning to deploy it on Kubernetes cluster. Below you can find more details.

1.) Create a deployment named grafana-deployment-nautilus using any grafana image for Grafana app. Set other parameters as per your choice.

2.) Create NodePort type service with nodePort 32000 to expose the app.

You need not to make any configuration changes inside the Grafana app once deployed, just make sure you are able to access the Grafana login page.

Note: The kubeclt on jump_host has been configured to work with kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>


---

## Step-by-Step Solution

**Step 1: Create the YAML manifest for the deployment and service**

- Use a text editor to create the manifest file with all required parameters:

```bash
vi /tmp/grafana.yaml
```
> *Opens the file `/tmp/grafana.yaml` for editing. Paste the following manifest and save the file:*

```yaml
apiVersion: v1
kind: Service
metadata:
  name: grafana-service-nautilus
spec:
  type: NodePort
  selector:
    app: grafana
  ports:
    - port: 3000
      targetPort: 3000
      nodePort: 32000
---
apiVersion: apps/v1
kind: Deployment
metadata:
  name: grafana-deployment-nautilus
spec:
  selector:
    matchLabels:
      app: grafana
  template:
    metadata:
      labels:
        app: grafana
    spec:
      containers:
        - name: grafana-container-nautilus
          image: grafana/grafana:latest
          ports:
            - containerPort: 3000
```
---

**Step 2: Create the deployment and service using kubectl**

- Apply the manifest to create the resources:

```bash
kubectl create -f /tmp/grafana.yaml
```
> *Creates the deployment and service in the cluster using the configuration defined in `/tmp/grafana.yaml`.*

---

**Step 3: Validate the deployment by accessing the NodePort**

- Open the port view in your environment or browser to access Grafana at the exposed NodePort (32000) and confirm the login page is accessible.