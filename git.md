# GIT CHEATSHEET

## **I. Setup**

- Configure Name
```bash
git config --global user.name "<name>"

# eg: git config --global user.name "Heidi Tran"
```

- Configure Email
```bash
git config --global user.email "<email>"

# eg: git config --global user.email "myEmail@gmail.com"
```

## **II. List all branch**

- List all local branches (*the name of branch you're on will be highlighted*)
```bash
git branch
```

- List all remote branches
```bash
git branch -r

# To refresh this list: git remote update
```

- Clean up local references to deleted remote branches
```bash
# Step 1: Show a list of references that can be deleted
git remote prune <remoteName> --dry-run

# Step 2: Delete those references
git remote prune <remoteName>
```


## **III. Create a branch** Default `remoteName` is `origin`

- Create a local branch and switch to it (***Prefer***)
```bash
git checkout -b <branchName>

# eg: git checkout -b new-feature
```

- Create a remote branch and add tracking (*Happen after you created a local branch and want to push it to a remote repo*). (***Prefer***) 
```bash
git push -u <remoteName> <branchName>

# eg: git push -u origin new-feature
```

- Create a local branch (*w/o set remote reference i.e. tracking*)
```bash
git branch <branchName>

# eg: git branch new-feature
```

- Create a remote branch (no tracking)
```bash
git push <remoteName> <branchName>

# eg: git push origin new-feature
```

- Add remote reference (tracking) to a brach
```bash
# Step 1: Push your new branch to remote repo
git push <remoteName> <branchName>

# Step 2: Set tracking
git branch -u <remoteName>/<branchName>
```

## **IV. Switching branch**

- Switch to a branch already on machine
```bash
git checkout <branchName>

# eg: git checkout a-different-feature
```

- Switch to a branch for the first time
```bash
git checkout -t <remoteName>/<branchName>

# eg: git checkout -t origin/a-different-feature
```

## **V. Committing**

- Add files to staging
```bash
git add <pathToFile>
git add <pathToFolder>

# eg: git add src/file.txt
# eg: git add src
# eg: To add all files from the current possition downward: git add .
```

- Remove files from staging (*only works if changes haven't been committed*)
```bash
git reset <pathToFile>
git reset <pathToFolder>

# eg: git reset src/file.txt
# eg: git reset src
```

- Commit file(s) with an inline message
```bash
git commit -m "<message>"
```

- Commit file(s) with message created from a text editor
```bash
git commit
```

- Revert a commit (*even after it has been pushed*)
```bash
git revert <commitHash>
```

- Edit commit message **for latest commit** after pushed
```bash
# Step 1: Unpushed commit
git commit --amend -m "<newMessage>"

# Update remote repo
git push --force <remoteName> <branchName>
```
## **VI. Pulling**

- Fetch all branches: Update references and histories of remote branches (*Won't pull in changes into local branches*)
```bash
git fetch <remoteName>

# eg: git fetch origin
```

- Fetch a branch: Update references and histories the remote branch (*Won't pull in changes into the local branch*)
```bash
git fetch <remoteName> <branchName>

# eg: git fetch origin a-remote-branch
```

- Pull to local branch **with rebase** (***Prefer***) (*Won't generate a merge commit and place local changes/commits on top of the commit list -> Minimize number of merge commits*)
```bash
git pull --rebase
```

- Pull to local branch: Retrieve changes from the remote server and integrate them into a local branch (*This will create a merge commit if there's unpushed/uncommited changes on the local branch*)
```bash
git pull
```

## **VII. Compare (Diff)**

- Diff all changes between files in the current working directory vs already committed (*only works before git add*)
```bash
git diff

# To diff a specific file: git diff <fileName>
```

- Diff 2 commits in history
```bash
git diff <olderCommitHash> <newerCommitHash>

# eg: git diff 12345 67890

# To show only file name add the flag: git diff --name-only <olderCommitHash> <newerCommitHash>

# To show only from a folder downward: git diff <olderCommitHash> <newerCommitHash> <path>
```

## **VIII. Pushing**

- Push local changes to the upstream remote branch
```bash
# Step 1: Check state of the current branch (any unpushed commits, untracked files)
git status

# Step 2: Push to upstream remote branch
git push <remoteName> <branchName>
```

## **IX. Merging**

- Rebase a branch into the current working branch (*Reapply local commits on top of pushed commits*)
```bash
git rebase <remoteName> <branchName>

# eg: git rebase origin feature-branch
```

- Merge a branch into the current working branch w/o conflict (*when the working branch and current branch has no conflicts*)
```bash
# Step 1: Merge a local branch
git merge <branchName>

# Step 2 option a (Prefer): Merge the remote branch with the "no fast forward" flag to preserve history of commits
git git merge <remoteName> <branchName> --no-ff

# Step 2 option b: Merge the remote branch
git merge <remoteName> <branchName>
```

- Merge a branch into the current working branch with conflicts (*when the working branch and current branch haave conflicts*)
```bash
# Step 1: Merge local branch
git merge <branchName> --no-ff
git mergetool

# Step 2: Merge remote branch
git merge <remoteName> <branchName> --no-ff
git mergetool
```

- Abort a merge attempt
```bash
git merge --abort
```

- Cherry picking commit from a branch and place them on top of the current branch
```bash
git cherry-pick <commitHash>

# eg: git cherry-pick 12345 
```

- Partial cherry picking (*Same as cherry picking but you only want some of the files. All files will be marked as modified, which you can then add and commit only files you want.*)
```bash
git cherry-pick -n <commitHash>

# eg: git cherry-pick -n 12345 
```

## **X. Clean up branches**

- Revert local changes for a single file
```bash
git checkout <filePath>

# To revert for multiple files: git checkout -- <file1Path> <file2Path>
```

- Revert/Restore a file to a specific commit
```bash
git checkout <commitHash> <filePath>

# eg: git checkout f123c3 test.txt

# To revert/restore for multiple files: git checkout <commitHash> -- <file1Path> <file2Path>
```

- Remove untracked files from the current working branch
```bash
git clean -df <filePath>

# To remove untracked files from a folder and downward: git clean -df <folderPath>
# eg: git clean -df src/app 
```

- Reset HEAD of the current branch to a specific state
```bash
# Option 1: Delete any commits or staged changes (Useful when you want to revert a `git add` command)
git reset

# Option 2: Remove all changes on the current branch -> Local HEAD = remote HEAD
git reset --hard

# Option 3: Remove all changes on the current branch and revert to the current state of a specific remote branch
git reset --hard <remoteName>/<branchName>

# eg: git reset --hard origin/new-feature
```
## **XI. Stashing**

- Stack the changes in a dirty working directory
```bash
# Option 1 (Prefer): Create a named stash
git stash save "<stashName>"

# Option 2: Create an anonymous stash
git stash

# eg: git stash save "myStash"
```

- View the list of stashed changes
```bash
git stash list
```

- List all files that were in the stash entry from the most recent stash
```bash
git stash show -p
```

- List all files that were in the stash entry from a specific stash
```bash
git stash show -p stash@{<stashId>}

# eg: git stash show -p stash@{1}
```

- Apply stashed changes from a stash to the current working directory (*Does not remove this stash entry from the stash stack*)
```bash
# Option 1: Apply the most recent stash entry
git stash apply

# Option 2: Apply a specific stash
git stash apply stash@{<stashId>}
```

- Pop stashed changes: Similar to apply stashed but remove the stash entry from the stash stack
```bash
# Option 1: Pop the most recent stash entry
git stash pop

# Option 2: Pop a specific stash
git stash pop stash@{<stashId>}
```

- Delete a stash from the stash stack
```bash
git stash drop stash@{<stashId>}

# eg: git stash drop stash@{1}
```

## **XII. List commits**

- List commits begin from the latest
```bash
git log

# If only wants to list file name: git log --name-only
```

- List commits begin from a specific commit
```bash
git log <commitHash>
```

- List commits from a specific author
```bash
git log --author="<userName>"
```

## **XIII. Delete a branch**

- Delete a local branch w/o any unmerged changes (*the branch won't be deleted on remote repo*)
```bash
git branch -d <branchName>

# eg: git branch -d branch-to-delete
```

- Delete a local branch with unmerged changes (*the branch won't be deleted on remote repo*)
```bash
git branch -D <branchName>

# eg: git branch -D branch-to-delete
```

- Delete a remote branch
```bash
git push -d <remoteName> <branchName>

# eg: git push -d origin branch-to-delete

# This can be shorhand to git push <remoteName> :<branchName>
# eg: git push origin :branch-to-delete 
```

## **XIV. Rename a branch**

- Rename current local branch (*will not rename remote branch*)
```bash
git branch -m <newBranchName>

# eg: git branch -m new-shiny-name
```

- Rename a local branch (*will not rename remote branch*)
```bash
git branch -m <oldBranchName> <newBranchName>

# eg: git branch -m old-name new-shiny-name
```

- Rename a remote branch
```bash
# Step 1: Rename local branch
git branch -m <newBranchName>

# Step 2: Delete the remote branch
git push -d <remoteName> <oldBranchName>

# Step 3: Push the new one
git push -u <remoteName> <newBranchName>

# eg: 
# 	git branch -m new-shiny-name
# 	git push -d origin old-name
# 	git push -u origin new-shiny-name
```

