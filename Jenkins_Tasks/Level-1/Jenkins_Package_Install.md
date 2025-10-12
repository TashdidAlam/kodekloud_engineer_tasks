# Question
Some new requirements have come up to install and configure some packages on the Nautilus infrastructure under Stratos Datacenter. The Nautilus DevOps team installed and configured a new Jenkins server so they wanted to create a Jenkins job to automate this task. Find below more details and complete the task accordingly:

**Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username `admin` and `Adm!n321` password.**

**Create a Jenkins job named `install-packages` and configure it to accomplish below given tasks.**

**Add a string parameter named `PACKAGE`.**
**Configure it to install a package on the storage server in Stratos Datacenter provided to the `$PACKAGE` parameter.**

Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also some times Jenkins UI gets stuck when Jenkins service restarts in the back end so in such case please make sure to refresh the UI page.

2. Make sure Jenkins job passes even on repetitive runs as validation may try to build the job multiple times.

3. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

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
   - In the "Available" tab, search for `SSH, SSH Agent, SSH Credentials` and select the plugins.
   - Click Install & restart jenkins server.

3. **Create a New Jenkins Job**

    - Click on "New Item" in the Jenkins dashboard to create a new Jenkins job.
    - Enter the job name as "install-packages."
    - Select "Freestyle project" and click "OK."

4. **Configure the Job**

    - In the job configuration page, under the "General" section, check the option "This project is parameterized."
    - Click the "Add Parameter" button and select "String Parameter."
    - Set the name of the parameter as "PACKAGE."

5. **Configure Build Step**

    - Scroll down to the "Build" section, and click on "Add build step."
    - Select "Execute shell vis ssh" as the build step.
    - In the "Command" text area, enter the command to install the package using the provided PACKAGE parameter. For example:

    ```
    echo "password" | sudo -S yum install -y $PACKAGE
    ```

    Replace "password" with the actual sever password mentioned on the question.

6. **Save and Build**

    - Click "Save" to save the job configuration.
    - To run the job, click on "Build with Parameters." You'll be prompted to enter the PACKAGE parameter value.
    - Enter the name of the package you want to install and click "Build."

You can verify if it installed the package or not by logging into the server
Click on confirm to complete the task
