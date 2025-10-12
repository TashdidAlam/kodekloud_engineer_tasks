# Question
The DevOps team of xFusionCorp Industries is planning to setup some CI/CD pipelines. After several meetings they have decided to use Jenkins server. So, we need to setup a Jenkins Server as soon as possible. Please complete the task as per requirements mentioned below:

**1. Install jenkins on jenkins server using yum utility only, and start its service. You might face timeout issue while starting the Jenkins service, please refer this link for help.**

**2. Jenkin's admin user name should be `theadmin`, password should be `Adm!n321`, full name should be `Ravi` and email should be `ravi@jenkins.stratos.xfusioncorp.com`.**

Note:

**1. For this task, ssh into the jenkins server using user `root` and password `S3curePass` from jump host.**

**2. After installing the Jenkins server, please click on the `Jenkins` button on the top bar to access Jenkins UI and follow the on-screen instructions to create an admin user.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

SSH into the jenkins server as root
```
ssh root@jenkins
```

Install wget
```
yum install wget -y
```

Download Jenkins repo and configure
```
wget -O /etc/yum.repos.d/jenkins.repo https://pkg.jenkins.io/redhat-stable/jenkins.repo
```
Jenkins key
```
rpm --import https://pkg.jenkins.io/redhat-stable/jenkins.io-2023.key
```
Install Jenkins package using YUM
```
yum install jenkins
```
Install Java before starting jenkins
```
yum install java-17-openjdk
```

Start Jenkins
```
systemctl daemon-reload
```

```
systemctl start jenkins
```

Open WEB GUI and proceed with further installation from Jenkins on top button

To unlock jenkins use initial password store in file 
```
cat /var/lib/jenkins/secrets/initialAdminPassword
```
Complete the installation using given username, given passwords, name & email . Save & Continue for now open Jenkins UI

Click on confirm to complete the task