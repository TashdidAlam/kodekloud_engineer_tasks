# Question
A new java-based application is ready to be deployed on a Kubernetes cluster. The development team had a meeting with the DevOps team share requirements and application scope. The team is ready to setup an application stack for it under their existing cluster. Below you can find the details for this:

Create a namespace named tomcat-namespace-xfusion.

Create a deployment for tomcat app which should be named tomcat-deployment-xfusion under the same namespace you created. Replicas count should be 1, the container should be named as tomcat-container-xfusion, its image should be gcr.io/kodekloud/centos-ssh-enabled:tomcat and its container port should be 8080.

Create a service for tomcat app which should be named as tomcat-service-xfusion under the same namespace you created. Service type should be NodePort. Port's protocol should be TCP, port should be 80, targetPort should be 8080 and nodePort should be 32227.

Before clicking on Finish button please make sure the application is up and running.

You can use any labels as per your choice.

Note: The kubectl on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create new namespace
```
kubectl create namespace tomcat-namespace-xfusion
```
Create yaml  file with all the parameters
```
apiVersion: v1

kind: Service

metadata:

  name: tomcat-service-xfusion

  namespace: tomcat-namespace-xfusion

spec:

  type: NodePort

  selector:

    app: tomcat

  ports:

    - port: 80

      protocol: TCP

      targetPort: 8080

      nodePort: 32227

---

apiVersion: apps/v1                          

kind: Deployment

metadata:

  name: tomcat-deployment-xfusion

  namespace: tomcat-namespace-xfusion

spec:

  replicas: 1

  selector:

    matchLabels:

      app: tomcat

  template:

    metadata:

      labels:

        app: tomcat

    spec:

      containers:

        - name: tomcat-container-xfusion

          image: gcr.io/kodekloud/centos-ssh-enabled:tomcat

          ports:

            - containerPort: 8080
 
```
Run below command to create pod
```
kubectl create -f /tmp/tomcat.yaml
```
Wait for  deployment & pods to get running status
Validate the task by running below command 
```
kubectl exec tomcat-deployment-xfusion-654c5b77ff-x8q7h -n tomcat-namespace-xfusion -- curl http://localhost:8080
```
Click on confirm to complete the task