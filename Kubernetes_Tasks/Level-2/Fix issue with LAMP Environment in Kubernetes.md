# Question
One of the DevOps team member was trying to install a WordPress website on a LAMP stack which is essentially deployed on Kubernetes cluster. It was working well and we could see the installation page a few hours ago. However something is messed up with the stack now due to a website went down. Please look into the issue and fix it:



FYI, deployment name is lamp-wp and its using a service named lamp-service. The Apache is using http default port and nodeport is 30008. From the application logs it has been identified that application is facing some issues while connecting to the database in addition to other issues. Additionally, there are some environment variables associated with the pods like MYSQL_ROOT_PASSWORD, MYSQL_DATABASE, MYSQL_USER, MYSQL_PASSWORD, MYSQL_HOST.


Also do not try to delete/modify any other existing components like deployment name, service name, types, labels etc.


Note: The kubectl utility on jump_host has been configured to work with the kubernetes cluster.

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Check and Describe the pods 
```
kubectl get pods
kubectl describe pods
kubectl logs <pod_name>
```
Checking all the pods and deployment in my case found out spelling mistake and  name mistake in yml files edited them and checked if everything was running or not then

Click on confirm to complete the task
