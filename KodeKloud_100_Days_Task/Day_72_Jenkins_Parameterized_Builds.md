# Question
A new DevOps Engineer has joined the team and he will be assigned some Jenkins related tasks. Before that, the team wanted to test a simple parameterized job to understand basic functionality of parameterized builds. He is given a simple parameterized job to build in Jenkins. Please find more details below:



Click on the Jenkins button on the top bar to access the Jenkins UI. Login using username admin and password Adm!n321.


1. Create a parameterized job which should be named as parameterized-job


2. Add a string parameter named Stage; its default value should be Build.


3. Add a choice parameter named env; its choices should be Development, Staging and Production.


4. Configure job to execute a shell command, which should echo both parameter values (you are passing in the job).


5. Build the Jenkins job at least once with choice parameter value Production to make sure it passes.


Note:

1. You might need to install some plugins and restart Jenkins service. So, we recommend clicking on Restart Jenkins when installation is complete and no jobs are running on plugin installation/update page i.e update centre. Also, Jenkins UI sometimes gets stuck when Jenkins service restarts in the back end. In this case, please make sure to refresh the UI page.


2. For these kind of scenarios requiring changes to be done in a web UI, please take screenshots so that you can share it with us for review in case your task is marked incomplete. You may also consider using a screen recording software such as loom.com to record and share your work.

Here’s the **complete step-by-step guide** to create and test the **parameterized Jenkins job (`parameterized-job`)**

---

## 🧩 Step 1: Access Jenkins

1. Click on the **Jenkins** button in the top bar of your lab environment.
2. Log in using:

   * **Username:** `admin`
   * **Password:** `Adm!n321`

---

## ⚙️ Step 2: Create the Job

1. On the Jenkins Dashboard, click **“New Item.”**
2. Enter the name: **`parameterized-job`**
3. Choose **“Freestyle project”**
4. Click **OK**

---

## 🧰 Step 3: Add Parameters

### ➤ Add the String Parameter

1. Scroll down and check the box **“This project is parameterized.”**
2. Click **Add Parameter → String Parameter**
3. Configure it as:

   * **Name:** `Stage`
   * **Default Value:** `Build`
   * **Description:** `Enter the stage name (e.g., Build, Test, Deploy)`

---

### ➤ Add the Choice Parameter

1. Click **Add Parameter → Choice Parameter**
2. Configure it as:

   * **Name:** `env`
   * **Choices:**

     ```
     Development
     Staging
     Production
     ```
   * **Description:** `Select the environment.`

---

## 💻 Step 4: Add the Build Step

1. Scroll to the **Build** section.
2. Click **Add build step → Execute shell.**
3. Enter the following shell script:

   ```bash
   #!/bin/bash
   echo "Stage parameter value: $Stage"
   echo "Environment parameter value: $env"
   ```

---

## 🔌 Step 5: (If Needed) Install Required Plugins (Not needed for this job)

If Jenkins shows any errors or missing parameter options:

1. Go to **Manage Jenkins → Plugins → Available Plugins**
2. Search for and install:

   * **Parameterized Trigger Plugin** (optional, supports complex parameter handling)
3. After installation, select **“Restart Jenkins when installation is complete and no jobs are running.”**
4. Once restarted, refresh the Jenkins page.

---

## 🧪 Step 6: Test the Job

1. From the Jenkins dashboard, open **`parameterized-job`**
2. Click **“Build with Parameters.”**
3. Set:

   * **Stage:** (leave default `Build`)
   * **env:** select **Production**
4. Click **Build**

### ✅ Verify Output

* Go to the **Console Output** of the build.
* You should see:

  ```
  Stage parameter value: Build
  Environment parameter value: Production
  Finished: SUCCESS
  ```

---
