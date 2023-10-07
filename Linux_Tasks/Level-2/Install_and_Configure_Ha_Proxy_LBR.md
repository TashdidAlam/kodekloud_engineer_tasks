# Question
There is a static website running in Stratos Datacenter. They have already configured the app servers and code is already deployed there. To make it work properly, they need to configure LBR server. There are number of options for that, but team has decided to go with `HAproxy`. FYI, apache is running on port `3002` on all app servers. Complete this task as per below details.

**a. Install and configure `HAproxy` on `LBR server` using `yum` only and make sure all app servers are added to HAproxy load balancer. HAproxy must serve on default `http` port (Note: Please do not remove stats socket `/var/lib/haproxy/stats` entry from haproxy default config.).**

**b. Once done, you can access the website using `StaticApp` button on the top bar.**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

**First log into LBR server & switch to root:**
```
ssh loki@stlb01
```
```
sudo su
```

**Install HAProxy**:

   Use the `yum` package manager to install HAProxy:

   ```bash
   sudo yum install haproxy -y
   ```

**Configure HAProxy**:

   ```bash
   sudo vi /etc/haproxy/haproxy.cfg
   ```

   Edit these parts of the file with the following configuration. 

   ```plaintext

   listen webapp
       bind *:80
       balance roundrobin
       server stapp01 172.16.238.10:3002 check
       server stapp02 172.16.238.11:3002 check
       server stapp03 172.16.238.12:3002 check
       # Add more servers as needed
   ```

   Save the configuration file and exit the text editor.

**Start HAProxy**:

   ```bash
   sudo systemctl start haproxy
   sudo systemctl enable haproxy
   ```

**Access the Website**:

You should now be able to access the website using the HAProxy load balancer. Use the StaticApp button on the top bar to access the website.

Click on confirm to complete the task
