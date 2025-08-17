# Question
The system admins team of xFusionCorp Industries needs to deploy a new application on App Server 3 in Stratos Datacenter. Prepare the server as per the requirements below:

**a. Install and configure nginx on App Server 3.**
**b. Move the self-signed SSL certificate and key from /tmp to an appropriate location and deploy them in Nginx.**
**c. Create an index.html file with content 'Welcome!' under the Nginx document root.**
**d. Test access to the server using curl from the jump host.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 3 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Install EPEL repository and Nginx**
- Install the required packages for Nginx.
  ```
  yum install epel-release -y
  yum install nginx -y
  ```
  > *Installs the EPEL repository and Nginx web server.*

**Step 3: Configure Nginx for SSL**
- Edit the Nginx configuration file to set up SSL and specify the server name and document root.
  ```
  vi /etc/nginx/nginx.conf
  ```
  > *Update the server block to listen on 443 with SSL, set the server_name to the app server's IP (172.16.238.12), and configure the certificate and key paths.*
  Example SSL config:
  ```
  ssl_certificate "/etc/pki/CA/certs/nautilus.crt";
  ssl_certificate_key "/etc/pki/CA/private/nautilus.key";
  ```

**Step 4: Move SSL certificate and key to appropriate locations**
- Create directories and copy the certificate and key files.
  ```
  mkdir -p /etc/pki/CA/certs
  mkdir -p /etc/pki/CA/private
  cp /tmp/nautilus.crt /etc/pki/CA/certs/
  cp /tmp/nautilus.key /etc/pki/CA/private/
  ```
  > *Ensures the SSL certificate and key are stored in secure, standard locations for Nginx.*

**Step 5: Create index.html with required content**
- Add a welcome message to the Nginx document root.
  ```
  rm /usr/share/nginx/html/index.html
  vi /usr/share/nginx/html/index.html
  cat /usr/share/nginx/html/index.html
  ```
  > *Removes any existing index.html, creates a new one, and verifies its content. Add 'Welcome!' inside the file.*

**Step 6: Start and check the status of Nginx**
- Start the Nginx service and verify it is running.
  ```
  systemctl start nginx
  systemctl status nginx
  ```
  > *Starts Nginx and checks its status to ensure it is running properly.*

**Step 7: Validate SSL setup from the jump host**
- Test access to the server using curl with SSL.
  ```
  curl -Ik https://stapp03
  ```
  > *Checks that the server is accessible over HTTPS and the SSL certificate is working.*

**Step 8: Complete the task**
- Click on Finish & Confirm to complete the task successfully.