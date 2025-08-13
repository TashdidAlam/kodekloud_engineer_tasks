# Question
The Nautilus application development team recently finished the beta version of a Java-based application, which they plan to deploy on one of the app servers in Stratos DC. After an internal team meeting, they decided to use the Tomcat application server. Complete the following steps as per the requirements:

**a. Install Tomcat server on App Server 2.**
**b. Configure it to run on port 8089.**
**c. Deploy the ROOT.war file (located on Jump host at /tmp) to this Tomcat server and ensure the webpage works directly on the base URL (curl http://stapp01:8089).**

<span style="color: red;">The below commands based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

# Steps

**Step 1: Copy the war file from the jump host to the app server**
- Use SCP to transfer the ROOT.war file to the app server's /tmp directory.
  ```
  scp /tmp/ROOT.war tony@stapp01:/tmp
  ```
  > *Securely copies the war file from the jump host to the app server.*

**Step 2: Log in to App Server 2 and switch to root user**
- Connect to the server and gain root privileges.
  ```
  ssh steve@stapp02
  sudo su -
  ```
  > *Establishes a secure shell session to App Server 2 as user steve, then switches to root for administrative access.*

**Step 3: Install Tomcat packages**
- Install Tomcat using yum package manager.
  ```
  yum install -y tomcat
  ```
  > *Installs Tomcat and its dependencies.*

**Step 4: Configure Tomcat to run on port 8089**
- Edit the Tomcat server configuration file and update the connector port.
  ```
  vi /usr/share/tomcat/conf/server.xml
  cat /usr/share/tomcat/conf/server.xml | grep port
  ```
  > *Change the Connector port to 8089 as required. Use grep to verify the port setting.*

**Step 5: Copy the war file to Tomcat's webapps directory**
- Move the ROOT.war file to the Tomcat deployment directory.
  ```
  cp /tmp/ROOT.war /usr/share/tomcat/webapps
  ls -ltr /usr/share/tomcat/webapps/
  ```
  > *Copies the war file and lists the contents of the webapps directory to confirm the file is present.*

**Step 6: Start the Tomcat service and check its status**
- Start Tomcat and verify it is running.
  ```
  systemctl start tomcat
  systemctl status tomcat
  ```
  > *Starts the Tomcat service and checks its status to ensure it is running properly.*

**Step 7: Validate the deployment**
- Test the application by accessing the base URL.
  ```
  curl -i http://stapp01:8089
  ```
  > *Validates that the application is accessible at the specified URL.*

**Step 8: Complete the task**
- Click on Finish & Confirm to complete the task successfully.