# Question
One of the Nautilus project developers created a container on `App Server 3`. This container was created for testing only and now we need to delete it. Accomplish this task as per details given below:

**Delete a container named `kke-container`, its running on `App Server 3` in Stratos DC.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 3 & Switch to root
```
ssh banner@stapp03
```
```
sudo su -
```
Check if the Container is running or not
```
docker ps
```
Stop the container
```
docker stop kke-container
```
Remove The container
```
docker rm kke-container
```
Again check if anything left or not
```
docker ps -a
```

Click on confirm to complete the task
