# Questions
The DevOps team of xFusionCorp Industries is planning to create a number of Jenkins jobs for different tasks. To easily manage the jobs within Jenkins UI they decided to create different Folders for all Jenkins jobs based on usage/nature of these jobs. Based on the requirements shared below please perform the below mentioned task:

Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username `admin` and password `Adm!n321`.

**1. There are already two jobs `httpd-php` and `services`.**

**2. Create a new folder called `Apache` under Jenkins UI.**

**3. Move the above mentioned two jobs under Apache folder.**

Note:
1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.

2. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

<span style="color: red;">The below tips based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

The step-by-step instructions on how to achieve the tasks described:

1. **Log in to Jenkins:**
   - Open your web browser and go to the Jenkins URL.
   - Log in using the provided credentials: 
     - Username: admin
     - Password: Adm!n321

2. **Install Required Plugins:**
   - If the necessary plugins are not already installed, you'll need to install them. Go to "Manage Jenkins" from the left sidebar.
   - Click on "Manage Plugins."
   - In the "Available" tab, search for `folder` and select the plugin.
   - Click "Install & restart.

3. **Create a New Folder:**
   - After installing the required plugins, go back to the Jenkins dashboard.
   - Click on "New Item" on the left sidebar.
   - Enter "Apache" as the item name.
   - Choose "Folder" as the type of item.
   - Click "OK" to create the Apache folder.

4. **Move Jobs to the Apache Folder:**
   - After creating the Apache folder, you'll need to move the existing jobs into it.
   - Click on the job "httpd-php" from the Jenkins dashboard.
   - Then Click on move
   - Select Jenkins >> Apache
   - Repeat the same steps for the "services" job, moving it into the "Apache" folder.

5. **Restart Jenkins:**
   - After making these changes, it's recommended to restart the Jenkins service to ensure everything is applied correctly.
   - Go to "Manage Jenkins" from the left sidebar.
   - Click on "Restart Jenkins" from the options on the page.

Click on confirm to complete the task
