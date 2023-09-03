# Question
There is a static website running within a container named nautilus, this container is running on `App Server 1`. Suddenly, we started facing some issues with the static website on `App Server 1`. Look into the issue to fix the same, you can find more details below:

**Container's volume `/usr/local/apache2/htdocs` is mapped with the host's volume `/var/www/html`.**

**The website should run on host port `8080` on `App Server 1` i.e command `curl http://localhost:8080/` should work on `App Server 1`.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

Sign in to App Server 1 & Switch to root
```
ssh tony@stapp01
```
```
sudo su -
```

First check if the container is running or not
```
docker ps
```
If container is not running then start the container
```
docker start nautilus
```
Check if the page is accesible or not
```
curl http://localhost:8080/
```

If accessible then Click on confirm to complete the task
