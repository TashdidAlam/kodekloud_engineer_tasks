# Question
The xFusionCorp Industries has recruited some new developers. There are already some existing jobs on Jenkins and two of these new developers need permissions to access those jobs. The development team has already shared those requirements with the DevOps team, so as per details mentioned below grant required permissions to the developers.



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


There is an existing Jenkins job named Packages, there are also two existing Jenkins users named sam with password sam@pass12345 and rohan with password rohan@pass12345.


Grant permissions to these users to access Packages job as per details mentioned below:


a.) Make sure to select Inherit permissions from parent ACL under inheritance strategy for granting permissions to these users.


b.) Grant mentioned permissions to sam user : build, configure and read.


c.) Grant mentioned permissions to rohan user : build, cancel, configure, read, update and tag.


Note:


Please do not modify/alter any other existing job configuration.


You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

This step-by-step procedure draws on the requirements outlined for the task and the solution demonstrated in the provided video transcript.

The primary goal is to grant specific permissions to users `sam` and `rohan` on the existing Jenkins job named `Packages`, ensuring that the inheritance strategy is set to **Inherit permissions from parent ACL**.

### Step-by-Step Procedure for Jenkins Job Access Control Configuration

#### A. Initial Access and Plugin Installation

1.  **Access and Login:** Click on the Jenkins button to access the Jenkins UI. Log in using the username `admin` and the password `Adm!n321`.
2.  **Install Required Plugin:** Navigate to **Manage Jenkins** and then to **Manage Plugins**.
3.  **Search and Install:** Click on **Available plugins**, search for `Matrix`, and check the box next to **Matrix authorization strategy**. Install this plugin.
4.  **Restart Jenkins (If Necessary):** If prompted or required, click on **Restart Jenkins** after the installation is complete and no jobs are running. You may need to refresh the UI page after the restart.

#### B. Configure Global Security

The Matrix authorization strategy plugin must be enabled globally, and initial overall read permissions must be granted for the job-specific permissions (which rely on "Inherit permissions from parent ACL") to function correctly.

5.  **Access Global Security:** Go to **Manage Jenkins** and click on **Configure Global Security**.
6.  **Enable Strategy:** Under the Authorization section, choose **Project-based and Matrix authorizing strategy**.
7.  **Grant Global Read Permissions:** To ensure the users can see the job and the job-level permissions are inherited successfully, grant them **Overall Read** permissions (or at least **Job Read**):
    *   Add the user `sam` (if not present).
    *   Add the user `rohan` (if not present).
    *   Grant both `sam` and `rohan` **Overall Read** permissions.
8.  **Save Global Configuration:** Click **Save** to apply the Global Security changes.

#### C. Configure Job-Specific Security for 'Packages'

9.  **Navigate to Job Configuration:** Go back to the dashboard, find the existing Jenkins job named **Packages**, and click **Configure**.
10. **Enable Project Security:** Within the job configuration, click on **Enable project security**. (This option becomes visible only after the necessary plugin is installed and enabled globally).
11. **Set Inheritance Strategy:** Make sure to select **Inherit permissions from parent ACL** under the inheritance strategy.
12. **Assign Permissions to 'sam':** Add the user `sam` to the project matrix. Grant the required permissions for `sam`:
    *   **build**
    *   **configure**
    *   **read**
13. **Assign Permissions to 'rohan':** Add the user `rohan` to the project matrix. Grant the required permissions for `rohan`:
    *   **build**
    *   **cancel**
    *   **configure**
    *   **read**
    *   **update**
    *   **tag**
14. **Final Save:** Click **Apply** and then **Save** to finalize the configuration for the `Packages` job.

*(Note: The video confirmed that after completing these steps, logging in as `rohan` (using password `rohan@pass12345`) showed all the necessary permissions like build and configure, confirming the successful completion of the task).*