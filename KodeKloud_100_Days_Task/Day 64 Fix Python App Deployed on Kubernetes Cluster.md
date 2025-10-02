## Fix Python App Deployed on Kubernetes Cluster

**Question:**
The deployment name is python-deployment-nautilus, its using poroko/flask-demo-appimage. The deployment and service of this app is already deployed.

nodePort should be 32345 and targetPort should be python flask app's default port.


Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

---
### Step-by-Step Troubleshooting & Fix Guide

#### Step 1: Check the Deployment Status
**Reason:** To verify if the deployment exists, is using the correct image, and to identify any misconfigurations or errors.

```bash
kubectl get deploy python-deployment-nautilus
```
Shows if the deployment is present and its current state.

```bash
kubectl describe deploy python-deployment-nautilus
```
Provides detailed information about the deployment, including image, container ports, and events.

```bash
kubectl get pods -l app=python-deployment-nautilus
```
Lists pods created by the deployment, filtered by label.

```bash
kubectl logs <pod-name>
```
Displays logs for the pod to help diagnose issues (replace `<pod-name>` with actual pod name).

#### Step 2: Fix Image Name and Container Port (if needed)
**Reason:** The app may not start if the image name is wrong or the container port is missing/incorrect. Flask's default port is 5000.

Edit the deployment to correct the image and container port:

```bash
kubectl edit deployment python-deployment-nautilus
```
Update the image to `poroko/flask-demo-appimage` and ensure the container port is set to `5000`.

#### Step 3: Fix Service TargetPort and NodePort
**Reason:** The service must forward traffic to the correct container port and expose the app on the specified NodePort.

Edit the service to set `targetPort: 5000` and `nodePort: 32345`:

```bash
kubectl edit svc python-deployment-nautilus
```
Set `targetPort: 5000` and `nodePort: 32345` in the service spec.

#### Step 4: Test the Application
**Reason:** To confirm the app is accessible via the NodePort and the deployment is fixed.

Click the app icon (if available) or access the app using the NodePort on the cluster node's IP.

---

**Note:**
- The `kubectl` command is already configured on the jump host for this cluster.
One of the DevOps engineers was trying to deploy a python app on Kubernetes cluster. Unfortunately, due to some mis-configuration, the application is not coming up. Please take a look into it and fix the issues. Application should be accessible on the specified nodePort.
