# Question
Sarah and Max were working on writing some stories which they have pushed to the repository. Max has recently added some new changes and is trying to push them to the repository but is facing some issues. Below you can find more details:

**SSH into the storage server using user max and password Max_pass123. Under /home/max you will find the story-blog repository. Try to push the changes to the origin repo and fix the issues. The story-index.txt must have titles for all 4 stories. Additionally, there is a typo in The Lion and the Mooose line where Mooose should be Mouse.**

<span style="color: red;">The below commands and actions are based on specific server, username, and other details that might differ. Please read the task carefully before executing.</span>

# Steps

**Step 1: SSH into the storage server as Max and navigate to the repo**
- Connect to the server and go to the story-blog repository.
  ```
  ssh max@ststor01
  cd /home/max/story-blog
  ```
  > *Establishes a secure shell session as Max and navigates to the project directory.*

**Step 2: Check and fix the local file**
- Update `story-index.txt` to include all 4 story titles and correct the typo (change "Mooose" to "Mouse").
  > *Ensures the file contains the required content and fixes any errors before committing.*

**Step 3: Stage and commit changes**
- Add and commit the updated file.
  ```
  git add story-index.txt
  git commit -m "Fixed index titles and typo in The Lion and the Mouse story"
  ```
  > *Stages and commits the changes with a descriptive message.*

**Step 4: Attempt to push — handle push rejection**
- Try to push changes to the remote repository.
  ```
  git push origin master
  ```
  > *If push is rejected due to remote changes, proceed to pull and resolve conflicts.*

**Step 5: Pull with rebase to keep a clean history**
- Pull the latest changes from the remote using rebase.
  ```
  git pull --rebase origin master
  ```
  > *Fetches and rebases remote changes onto your local branch, avoiding unnecessary merge commits.*

**Step 6: Resolve merge conflict in story-index.txt**
- Edit the file to merge both Sarah’s and Max’s updates, then stage and continue the rebase.
  ```
  git add story-index.txt
  git rebase --continue
  ```
  > *Resolves the conflict, stages the resolved file, and continues the rebase process.*

**Step 7: Push the changes successfully**
- Push the resolved changes to the remote repository.
  ```
  git push origin master
  ```
  > *Uploads the final changes to the remote master branch.*

**Step 8: UI Check (optional)**
- Log in to the Gitea UI as max (Max_pass123) or sarah (Sarah_pass123), open the story-blog repo, and confirm that `story-index.txt` in the master branch contains all 4 titles and the typo is fixed.
  > *Verifies the changes through the web interface for additional confirmation.*

**Step 9: Complete the task**
- Click confirm to finish the task.
