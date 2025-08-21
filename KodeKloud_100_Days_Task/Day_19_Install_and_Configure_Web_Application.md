# Question
xFusionCorp Industries is planning to host two static websites on their infra in Stratos Datacenter. Prepare App Server 1 as per the requirements below:

**a. Install httpd package and dependencies on App Server 1.**
**b. Configure Apache to serve on port 3002.**
**c. Set up the two website backups (`ecommerce` and `cluster`) from jump_host so that they are accessible at http://localhost:3002/ecommerce/ and http://localhost:3002/cluster/.**
**d. Validate access using curl on the app server.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 1 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh tony@stapp01
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 1 as user tony, then switches to root for administrative access.*

**Step 2: Install Apache (httpd) on App Server 1**
- Install the web server package.
  ```
  yum install -y httpd
  ```
  > *Installs Apache web server to serve the websites.*

**Step 3: Configure Apache to listen on port 3002**
- Edit the Apache configuration file to change the listening port.
  ```
  vi /etc/httpd/conf/httpd.conf
  ```
  > *Change `Listen 80` to `Listen 3002`. Update any `<VirtualHost>` sections to `*:3002` if present.*

**Step 4: Enable and start Apache**
- Make sure Apache starts on boot and is running.
  ```
  systemctl enable httpd
  systemctl start httpd
  systemctl status httpd
  ```
  > *Enables and starts Apache, then verifies it is running.*

**Step 5: Copy website folders from jump_host to app server**
- Use SCP to transfer the `ecommerce` and `cluster` folders from the jump host to the app server's `/tmp` directory.
  ```
  scp -r /home/thor/ecommerce tony@stapp01:/tmp
  scp -r /home/thor/cluster tony@stapp01:/tmp
  ```
  > *Copies the website backup folders from the jump host to the app server's /tmp directory.*

> **Note:** Steps 6 and 7 should be performed on App Server 1 after copying the website folders from the jump host.

**Step 6: Move website folders to the Apache document root**
- Move the copied folders to `/var/www/html`.
  ```
  mv /tmp/ecommerce /var/www/html/
  mv /tmp/cluster /var/www/html/
  ls -ltr /var/www/html/
  ```
  > *Moves the website folders to the document root and lists them to confirm.*

**Step 7: Validate website access using curl**
- Test access to both websites on the configured port.
  ```
  curl http://localhost:3002/ecommerce/
  curl http://localhost:3002/cluster/
  ```
  > *Confirms that both websites are accessible at the correct URLs.*

**Step 8: Complete the task**
- Click on confirm to complete the task.
