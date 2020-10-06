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


## **III. Create a branch**

- Create a local branch and switch to it (Prefer)
```bash
git checkout -b <branchName>

# eg: git checkout -b new-feature
```

- Create a local branch
```bash
git branch <branchName>

# eg: git branch new-feature
```

- Create a remote branch and add tracking (*Happen after you created a local branch and want to push it to a remote repo*). Default `remoteName` is `origin`
```bash
git push -u <remoteName> <branchName>

# eg: git push -u origin new-feature
```

- Create a remote branch (no tracking)
```bash
git push <remoteName> <branchName>

# eg: git push origin new-feature
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

## **VI. List commits**

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

## **V. Delete a branch**

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

## **VI. Rename a branch**

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

