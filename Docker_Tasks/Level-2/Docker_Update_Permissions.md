# Question
One of the Nautilus project developers need access to run docker commands on App Server 1. This user is already created on the server. Accomplish this task as per details given below:

**User `siva` is not able to run `docker` commands on `App Server 1` in Stratos DC, make the required changes so that this user can run docker commands `without sudo`.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**SSH into App Server 1 & switch to root**:

   ```bash
   ssh siva@AppServer1_IP
   ```
   ```
   sudo su
   ```

**Add User to the Docker Group**:

   ```bash
   sudo usermod -aG docker siva
   ```

**Switch to siva**:
```
su siva
```
**Verify Docker Access**:

   ```bash
   docker --version
   ```
Click on confirm to complete the task
