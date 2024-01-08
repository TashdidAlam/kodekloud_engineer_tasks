# Question
The Nautilus DevOps team is planning to set up a Jenkins CI server to create/manage some deployment pipelines for some of the projects. They want to set up the Jenkins server on Kubernetes cluster. Below you can find more details about the task:

1) Create namespace jenkins

2) Create a Service for jenkins deployment. Service name should be jenkins-service under jenkins namespace, type should be NodePort, targetport should be 8080 and nodePort should be 30008

3) Create a Jenkins Deployment under jenkins namespace, It should be name as jenkins-deployment , labels app should be jenkins , container name should be jenkins-container , use jenkins image, containerPort should be 8080 and replicas count should be 1.

Make sure to wait for pods to be in running state before clicking on Finish button.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Create namespace as per the task request.
```
kubectl create namespace  jenkins
kubectl get namespace
```
Create  jenkins yaml  file with all the parameters 
```
vi /tmp/jenkins.yaml
```
```
apiVersion: v1

kind: Service

metadata:

  name: jenkins-service

  namespace: jenkins

spec:

  type: NodePort

  selector:

    app: jenkins

  ports:

    - port: 8080

      targetPort: 8080

      nodePort: 30008

---

apiVersion: apps/v1

kind: Deployment

metadata:

  name: jenkins-deployment

  namespace: jenkins

  labels:

    app: jenkins

spec:

  replicas: 1

  selector:

    matchLabels:

      app: jenkins

  template:

    metadata:

      labels:

        app: jenkins

    spec:

      containers:

        - name: jenkins-container

          image: jenkins/jenkins

          ports:

            - containerPort: 8080
```

Run the below command to create a pod
```
kubectl create -f /tmp/jenkins.yaml
```
Wait for deployment & pods to get running status
Validate the task by curl or open the browser by clicking 'Open Port on Host 1'
```
kubectl exec jenkins-deployment-6b6c78f968-27gpz -n jenkins -- curl http://localhost
```
Click on confirm to complete the task
