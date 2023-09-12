# Question
The Nautilus team is planning to use Jenkins for some of their CI/CD pipelines. DevOps team has just installed a fresh Jenkins server and they are configuring it further to be available for use.

**Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username `admin` and password `Adm!n321`.**

It has only a sample job for now. A new developer has joined the Nautilus application development team and they want this user to be added to the Jenkins server as per the details mentioned below:

**1. Create a jenkins user named `siva` with `YchZHRcLkL` password, their full name should be `Siva` (it is case sensitive).**

**2. Using `Project-based Matrix Authorization Strategy` assign overall `read` permission to siva user.**

**3. Remember to remove all permissions for Anonymous users (if given) and make sure `admin` user has overall Administer permissions.**

**4. There is one existing job, make sure `siva` only has `read` permissions to that job (we are not worried about other permissions like Agent, SCM, etc.).**

Note:
1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, in case Jenkins UI gets stuck when Jenkins service restarts in the back end, please make sure to refresh the UI page.

2. Do not immediately click on Finish button if you have restarted the Jenkins service, please wait for Jenkins login page to come back before finishing your task.

3. For these kind of scenarios that required changes to be done from a web UI, please take screenshots of your work so that you can share the same with us for review purpose (in case your task is marked incomplete or failed). You may also consider using a screen recording software such as loom.com to record and share your work.

<span style="color: red;">The below tips based on different question server, user name & other details that might differ. So please read the task carefully before executing it. </span>

The step-by-step instructions on how to achieve the tasks described:

**Step 1: Log in to Jenkins**

1. Open your web browser and navigate to your Jenkins server

2. Log in to Jenkins with your administrator credentials.

**Step 2: Create a Jenkins User**

3. Click on "Manage Jenkins" in the Jenkins dashboard.

4. Click on "Manage Users."

5. Click on "Create User" to create a new user.

6. Fill in the user details as follows:
   - **Username:** siva
   - **Password:** YchZHRcLkL
   - **Full Name:** Siva (case-sensitive)

7. Click "Create User" to create the user.

**Step 3: Install Plugin**

8. Install matrix authentication plugin and restart the jenkins server.

**Step 4: Configure Permissions**

9. Click on "Manage Jenkins" in the Jenkins dashboard again.

10. Click on "Configure Global Security."

11. Under "Authorization," select "Project-based Matrix Authorization Strategy."

12. Add "siva" user, and in the "Overall" & 'Job' column, check the "Read" box.

13. Scroll down and ensure that the "Anonymous" user has no permissions by unchecking all the boxes for "Anonymous."

14. Make sure that the "admin" user has "Overall/Administer" permissions.


**Step 5: Restart Jenkins**

15. Go to "Manage Jenkins" > "Manage Plugins."

16. If any plugins need to be installed, do so here. When prompted, click "Restart Jenkins when installation is complete and no jobs are running."

**Step 6: Verify**

17. Wait for Jenkins to restart completely and the login page to appear.

18. Log in as the "siva" user to verify that the changes have been applied correctly.

Click on confirm to complete the task