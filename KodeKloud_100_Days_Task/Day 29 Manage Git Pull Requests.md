# Question
Max wants to push some new changes to one of the repositories, but direct pushes to the master branch are not allowed. The master branch should only contain reviewed and approved content. To ensure proper workflow, follow the steps below to create and manage a Pull Request (PR) for merging Max's story into master.

<span style="color: red;">The below commands and actions are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: Verify Max's repository and branch on the Storage Server**
- SSH into the Storage Server as Max and check the repository contents and commit history.
  ```
  ssh max@ststor01
  # Password: Max_pass123
  cd ~/<cloned-repo-folder>
  ls
  git log --oneline --author=max
  ```
  > *Ensures you are logged in as Max, navigates to the cloned repository, lists files (e.g., fox-and-grapes.txt), and checks commit history to confirm Max's story and previous commits.*

**Step 2: Create a Pull Request (PR) in Gitea**
- Open the Gitea UI, log in as Max, and create a PR to merge the story branch into master.
  - Click the Gitea UI button on the top bar to open Gitea.
  - Login credentials: Username: max, Password: Max_pass123
  - Locate the repository in the dashboard.
  - Create a PR with:
    - Title: Added fox-and-grapes story
    - Pull from branch (source): story/fox-and-grapes
    - Merge into branch (destination): master
  > *Creates a formal request to merge Max's changes into master, ensuring code review and approval before merging.*

**Step 3: Assign a reviewer to the PR**
- On the PR page, add Tom as the reviewer.
  - Find Reviewers on the right-hand side.
  - Add tom as the reviewer.
  > *Assigns Tom to review the PR, enforcing the review process before merging.*

**Step 4: Review and merge the PR as Tom**
- Log out Max from Gitea and log in as Tom to review and approve the PR.
  - Username: tom, Password: Tom_pass123
  - Go to the PR titled "Added fox-and-grapes story".
  - Click Review → Approve changes.
  - Click Merge (usually Merge Pull Request button) to merge the PR into master.
  > *Tom reviews and approves the changes, then merges them into master, ensuring only reviewed content is added.*

**Step 5: Confirm the story is in the master branch**
- After merging, verify that the story is now present in the master branch.
  > *Ensures the workflow was successful and the story is now part of the master branch.*

**Step 6: Complete the task**
- Click confirm to finish the task.

**Note:** For scenarios requiring changes in a web UI, take screenshots or record your screen for review in case your task is marked incomplete.