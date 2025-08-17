# Question
Due to increasing traffic and performance degradation, the Nautilus production support team decided to deploy their application on a high availability stack in Stratos DC. The final step is to configure the LBR (load balancer) server as described below:

**a. Install nginx on the LBR server.**
**b. Configure load-balancing in the main Nginx configuration file (/etc/nginx/nginx.conf) using all App Servers.**
**c. Do not change the Apache port on app servers; ensure Apache is running on all app servers.**
**d. After configuration, access the website using the StaticApp button.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Check Apache port and status on all app servers**
- SSH into each app server and verify the Apache port and service status.
  ```
  ssh tony@stapp01
  sudo su -
  grep -i "Listen" /etc/httpd/conf/httpd.conf
  ss -tulpn | grep httpd
  systemctl status httpd
  ```
  > *Checks which port Apache is running on and ensures the service is up. Repeat for all app servers.*

**Step 2: Log in to the LBR server and switch to root user**
- Connect to the load balancer server and gain root privileges.
  ```
  ssh loki@stlb01
  sudo su -
  ```
  > *Establishes a secure shell session to the LBR server as user loki, then switches to root for administrative access.*

**Step 3: Install nginx on the LBR server**
- Install the Nginx web server package.
  ```
  yum install -y nginx
  ```
  > *Installs Nginx, which will be used for load balancing.*

**Step 4: Configure Nginx for load balancing**
- Edit the main Nginx configuration file to set up the upstream and server blocks.
  ```
  vi /etc/nginx/nginx.conf
  ```
  > *Open the Nginx config file for editing. Add the following inside the http block:*
  ```
  upstream backends {
      server 172.16.238.10:8088;
      server 172.16.238.11:8088;
      server 172.16.238.12:8088;
  }
  server {
      server_name stlb01.stratos.xfusioncorp.com;
      location / {
          proxy_pass http://backends;
      }
  }
  ```
  > *Defines the backend app servers and configures Nginx to proxy requests to them.*

**Step 5: Start, enable, and reload Nginx**
- Ensure Nginx is running and enabled at boot.
  ```
  systemctl start nginx
  systemctl enable nginx
  systemctl reload nginx
  ```
  > *Starts Nginx, enables it to start on boot, and reloads the configuration.*

**Step 6: Validate the load balancer setup**
- Access the website using the StaticApp button or by browsing to the LBR server's address. You should see the Apache page from the app servers.
  > *Confirms that requests are being properly load balanced to the backend app servers.*

**Step 7: Complete the task**
- Click on confirm & finish the task