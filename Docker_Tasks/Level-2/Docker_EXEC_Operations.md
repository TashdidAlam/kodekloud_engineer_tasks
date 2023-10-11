# Question
One of the Nautilus DevOps team members was working to configure services on a kkloud container that is running on App Server 3 in Stratos Datacenter. Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:

**a. Install `apache2` in `kkloud` container using `apt` that is running on `App Server 3` in Stratos Datacenter.**

**b. Configure Apache to listen on port `6200` instead of default http port. Do not bind it to listen on specific IP or hostname only, i.e it should listen on `localhost, 127.0.0.1, container ip, etc`.**

**c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**SSH into App Server 1 & switch to root**:

```bash
ssh banner@stapp03
```
```
sudo su
```

**Login on docker container (ubuntu ) & install apache2**
```bash
docker exec -it kkloud /bin/sh
```
```bash
apt install apache2 -y
```

**Go to the apache2 folder where all configuration files you will find**
```bash
cd /etc/apache2
```

**Since in this Container no Vi editor was installed, hence using sed commands.**
```bash
sed -i 's/Listen 80/Listen 6200/g' ports.conf

sed -i 's/:80/:6200/g' apache2.conf

sed -i 's/#ServerName www.example.com/ServerName localhost/g' apache2.conf
```

**Start apache2 service & confirm the running status**
```bash
service apache2 start
service apache2 status
```
**Validate the task**

```bash
curl -Ik localhost:6200
```

Click on confirm to complete the task