# Question
We are working on hardening Apache web server on all app servers. As a part of this process we want to add some of the Apache response headers for security purpose. We are testing the settings one by one on all app servers. As per details mentioned below enable these headers for Apache:


**Install `httpd` package on `App Server 1` using `yum` and configure it to run on `3001` port, make sure to start its service.**


**Create an `index.html` file under Apache's default document root i.e `/var/www/html` and add below given content in it.**


`Welcome to the xFusionCorp Industries!`


**Configure Apache to enable below mentioned headers:**


`X-XSS-Protection` header with `value 1; mode=block`


`X-Frame-Options` header with value `SAMEORIGIN`


`X-Content-Type-Options` header with value `nosniff`


**Note: You can test using curl on the given app server as LBR URL will not work for this task.**


<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**First sign into Appserver 1 & switch to root**

```
ssh tony@staapp01
```
```
sudo su
```

**Install httpd package on the server**
```bash
yum install httpd -y
```
**Create the `index.html` file with the provided content in the default document root:**

```bash
echo "Welcome to the xFusionCorp Industries!" | sudo tee /var/www/html/index.html
```

**Now, configure Apache to add the desired headers. Edit the Apache configuration file with a text editor like**

```bash
vi /etc/httpd/conf/httpd.conf
```

**Add the following lines inside the `<Directory "/var/www/html">` section to set the required response headers:**

```apache
Header set X-XSS-Protection "1; mode=block"
Header always append X-Frame-Options SAMEORIGIN
Header always append X-Content-Type-Options nosniff
```

The section should look like this:

```apache
<Directory "/var/www/html">
    ...
    Header set X-XSS-Protection "1; mode=block"
    Header always append X-Frame-Options SAMEORIGIN
    Header always append X-Content-Type-Options nosniff
    ...
</Directory>
```

Save the file and exit the text editor.

Start Apache to apply the changes:

```bash
systemctl start httpd
systemctl enable httpd
systemctl status httpd
```

Apache is now configured with the specified response headers. You can test the headers using `curl` on App Server 1:

```bash
curl -i http://localhost:3001/
```

You should see the `X-XSS-Protection`, `X-Frame-Options`, and `X-Content-Type-Options` headers in the response.

Click on confirm to complete the task