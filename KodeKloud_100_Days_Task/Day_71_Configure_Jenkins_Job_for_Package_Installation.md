# Question
Some new requirements have come up to install and configure some packages on the Nautilus infrastructure under Stratos Datacenter. The Nautilus DevOps team installed and configured a new Jenkins server so they wanted to create a Jenkins job to automate this task. Find below more details and complete the task accordingly:



1. Access the Jenkins UI by clicking on the Jenkins button in the top bar. Log in using the credentials: username admin and password Adm!n321.


2. Create a new Jenkins job named install-packages and configure it with the following specifications:


Add a string parameter named PACKAGE.
Configure the job to install a package specified in the $PACKAGE parameter on the storage server within the Stratos Datacenter.

Note:


1. Ensure to install any required plugins and restart the Jenkins service if necessary. Opt for Restart Jenkins when installation is complete and no jobs are running on the plugin installation/update page. Refresh the UI page if needed after restarting the service.


2. Verify that the Jenkins job runs successfully on repeated executions to ensure reliability.


3. Capture screenshots of your configuration for documentation and review purposes. Alternatively, use screen recording software like loom.com for comprehensive documentation and sharing.


### Step-by-Step Task Completion

#### 1. Accessing Jenkins and Preparing the Environment

1.  **Access and Login:** Access the Jenkins UI. Log in using the required credentials (username `admin` and password `Adm!n321`).
2.  **Install Required Plugins:** Download and install necessary plugins. The video selected three plugins for installation.
3.  **Restart Jenkins:** Initiate the restart of the Jenkins server, opting for the option that restarts Jenkins after installation is complete.
4.  **Verification:** Log back in to Jenkins and verify that the required plugins are successfully installed.

#### 2. Configuring Remote Access Credentials

To allow Jenkins to connect to the remote storage server, the credentials for the remote user (Natasha) must be configured in Jenkins.

1.  Navigate to **Credentials**, and then select **System**.
2.  Click to add a new domain/credential.
3.  Add the username (Natasha) and her corresponding password.
4.  Use her server name as the ID for this credential entry.
5.  Create the credential.

#### 3. Configuring the Remote Host

Next, the storage server must be defined as a remote host in the Jenkins system configuration.

1.  Navigate to **Manage Jenkins** and then select **System**.
2.  Locate the section for **Remote Host** and add a new entry.
3.  Paste the host name of the storage server.
4.  Specify **Port 22**.
5.  Select the credential set up for **Natasha**.
6.  **Test the connection** to confirm the connection is successful.
7.  **Save** the system settings.

#### 4. Creating the Jenkins Job

1.  Create a new Jenkins job.
2.  Name the job **`install-packages`**.
3.  Select **Freestyle Project**.

#### 5. Configuring Job Parameterization

The job needs to accept a package name dynamically via a parameter.

1.  In the job configuration, check the option **"This project is parameterized"**.
2.  Click **"Add Parameter"** and select **String Parameter**.
3.  Name the parameter **`package`** (The transcript uses lowercase `package`).
4.  Provide a brief description, such as "package name".

#### 6. Configuring the Build Step

The job needs a build step that executes the installation command remotely on the storage server.

1.  In the Build section, add a build step.
2.  Select **"Execute script on remote host using SSH and environment subject"**.
3.  Enter the command required to install the package, utilizing the parameter variable: **`install $PACKAGE`** (The transcript explicitly mentions using the variable in the command structure: `install i use the variable`).
4.  **Apply** and **Save** the job configuration.

#### 7. Testing and Verification

The job must be tested to ensure reliability (as required by Note 2).

1.  Go to **Build with Parameters**.
2.  In the parameter field for `package`, enter a test package name, such as **`git`**.
3.  Click **Build**.
4.  *(Note on Troubleshooting: During the testing in the source video, the initial run failed due to an incorrect password (a requirement for an uppercase 'W' was missed). The error was corrected.)*
5.  Run the build again with the package name `git`.
6.  Check the **Console Output** to verify that the build was successful. The output should confirm that the specified package (`git`) was successfully downloaded and installed on the storage server.