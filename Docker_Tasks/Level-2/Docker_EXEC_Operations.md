# Question
One of the Nautilus DevOps team members was working to configure services on a `kkloud` container that is running on App Server 3 in Stratos Datacenter. Due to some personal work he is on PTO for the rest of the week, but we need to finish his pending work ASAP. Please complete the remaining work as per details given below:

**a. Install `apache2` in `kkloud` container using `apt` that is running on App Server 3 in Stratos Datacenter.**
**b. Configure Apache to listen on port `6200` instead of the default HTTP port. Do not bind it to listen on a specific IP or hostname only; it should listen on `localhost, 127.0.0.1, container IP, etc`.**
**c. Make sure Apache service is up and running inside the container. Keep the container in running state at the end.**

<span style="color: red;">The below commands are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into App Server 3 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh banner@stapp03
  sudo su
  ```
  > *Establishes a secure shell session to App Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Access the running kkloud container**
- Open an interactive shell inside the container.
  ```
  docker exec -it kkloud /bin/sh
  ```
  > *Allows you to run commands inside the running container.*

**Step 3: Install Apache2 inside the container**
- Use apt to install the Apache2 web server.
  ```
  apt install apache2 -y
  ```
  > *Installs Apache2 and its dependencies inside the container.*

**Step 4: Update Apache configuration to listen on port 6200**
- Change the listening port in the configuration files using sed (since vi is not installed).
  ```
  cd /etc/apache2
  sed -i 's/Listen 80/Listen 6200/g' ports.conf
  sed -i 's/:80/:6200/g' apache2.conf
  sed -i 's/#ServerName www.example.com/ServerName localhost/g' apache2.conf
  ```
  > *Updates Apache to listen on port 6200 and sets the ServerName to localhost.*

**Step 5: Start Apache2 service and confirm status**
- Start the Apache2 service and check if it is running.
  ```
  service apache2 start
  service apache2 status
  ```
  > *Ensures Apache2 is running and serving on the new port.*

**Step 6: Validate Apache is running on port 6200**
- Use curl to check if Apache is serving on the correct port.
  ```
  curl -Ik localhost:6200
  ```
  > *Sends a request to the server to confirm Apache is accessible on port 6200.*

**Step 7: Complete the task**
- Click on confirm to complete the task