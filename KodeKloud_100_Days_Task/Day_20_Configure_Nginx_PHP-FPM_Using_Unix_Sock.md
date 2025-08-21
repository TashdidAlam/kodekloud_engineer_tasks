# Question
The Nautilus application development team is planning to launch a new PHP-based application on Nautilus infra in Stratos DC. Prepare App Server 3 as per the requirements below:

**a. Install nginx on App Server 3, configure it to use port 8094, and set its document root to /var/www/html.**
**b. Install php-fpm version 8.3 on App Server 3, and configure it to use the unix socket /var/run/php-fpm/default.sock.**
**c. Configure php-fpm and nginx to work together.**
**d. Validate the setup using curl from the jump host.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Log in to App Server 3 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh banner@stapp03
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 3 as user banner, then switches to root for administrative access.*

**Step 2: Install and enable Nginx**
- Install the Nginx web server and enable it to start on boot.
  ```
  yum install -y nginx
  systemctl enable nginx
  ```
  > *Installs and enables Nginx for web serving.*

**Step 3: Configure Nginx for PHP-FPM and custom port**
- Edit the Nginx configuration to set the port, document root, and PHP handling.
  ```
  vi /etc/nginx/nginx.conf
  ```
  > *Set `listen 8094`, `root /var/www/html`, and configure the location block for PHP to use the unix socket.*
  Example config:
  ```
  server {
      listen 8094;
      server_name stapp03;
      root /var/www/html;
      index index.php index.html;
      location / {
          try_files $uri $uri/ =404;
      }
      location ~ \.php$ {
          include fastcgi_params;
          fastcgi_pass unix:/var/run/php-fpm/default.sock;
          fastcgi_index index.php;
          fastcgi_param SCRIPT_FILENAME $document_root$fastcgi_script_name;
      }
  }
  ```

**Step 4: Install PHP-FPM 8.3 and PHP extensions**
- Enable the correct PHP module and install PHP-FPM and required extensions.
  ```
  dnf install epel-release -y
  dnf install https://rpms.remirepo.net/enterprise/remi-release-9.rpm -y
  dnf module enable php:remi-8.3 -y
  dnf install php-fpm php php-cli php-common php-mysqlnd php-gd php-xml php-mbstring php-pdo php-opcache -y
  systemctl start php-fpm
  systemctl enable php-fpm
  php -v
  systemctl status php-fpm
  ```
  > *Installs PHP-FPM 8.3 and necessary PHP extensions, then starts and enables the service.*

**Step 5: Configure PHP-FPM to use the unix socket and nginx user**
- Edit the PHP-FPM pool configuration and set permissions.
  ```
  vi /etc/php-fpm.d/www.conf
  ```
  > *Set `user = nginx`, `group = nginx`, `listen = /var/run/php-fpm/default.sock`, `listen.owner = nginx`, `listen.group = nginx`, `listen.mode = 0660`.*
  Ensure the socket directory exists and has correct ownership:
  ```
  mkdir -p /var/run/php-fpm
  chown -R nginx:nginx /var/run/php-fpm
  systemctl enable --now php-fpm
  systemctl restart php-fpm
  ```
  > *Ensures PHP-FPM uses the correct socket and permissions for Nginx integration.*

**Step 6: Restart Nginx to apply changes**
- Restart the Nginx service.
  ```
  systemctl restart nginx
  ```
  > *Applies the new configuration and ensures Nginx is running with PHP-FPM integration.*

**Step 7: Validate the setup from the jump host**
- Test the website using curl from the jump host.
  ```
  curl http://stapp03:8094/index.php
  ```
  > *Confirms that Nginx and PHP-FPM are working together and serving PHP files correctly.*

**Step 8: Complete the task**
- Click on confirm to complete the task.