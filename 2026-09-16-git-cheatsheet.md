# Git Cheatsheet

A practical Git command reference for your daily development workflow with Java, HTML, CSS, JavaScript, and TypeScript.

Git is a distributed version control system. It tracks changes in your project, lets you create branches, and helps you collaborate with other developers.

## 1. Git's basic workflow
```
Working Directory
    |
Edit, create, and delete files
git add
    |
Staging Area (Index)
    |
Choose changes for the next commit
git commit
    |
Local Repository
    |
Saved snapshots of your project history
git push / git pull
    |
Remote Repository
GitHub, GitLab, or another Git server
```
The most important commands to remember:



```Bash
git status
git add .
git commit -m "Describe changes"
git push
git pull
```

## 2. Initial setup

Configure your identity (usually once per machine):



```Bash
git config --global user.name "Your Name"
git config --global user.email "you@example.com"
```

Check configuration:



```Bash
git config --list
git config --global --get user.name
git config --global --get user.email
```

Useful configuration:



```Bash
# Default branch name for new repositories
git config --global init.defaultBranch main

# Use colored output
git config --global color.ui auto
```

## 3. Create or download a repository

|Command|Purpose|
| --- | --- |
|`git init`|Initialize Git in current directory|
|`git clone URL`|Download a repository and its history|
|`git clone URL my-project`|Clone into a named directory|
|`git status`|Check current changes and branch|
|`git rev-parse --show-toplevel`|Show repository root|

Example:



```Bash
mkdir my-web-project
cd my-web-project

git init
```

Or clone an existing project:



```Bash
git clone https://github.com/user/project.git
cd project
```

## 4. Everyday commands
```
git status
See modified, staged, and untracked files.

git add index.html
Stage one specific file.

git add .
Stage changes under the current directory.

git diff
Inspect unstaged changes.

git diff --staged
Inspect staged changes.

git commit -m "Add login page"
Save staged changes in a commit.

git log --oneline --graph --all
View a compact history graph.
```
### Example: your first commit



```Bash
git status
git add index.html style.css app.js
git diff --staged
git commit -m "Create initial web page"
```

Remember: `git add` stages a snapshot of the file's current contents. If you edit the file again after staging, you may need to stage it again.


## 5. Branches

Branches let you develop features or fix bugs separately from your main code.

|Command|Purpose|
| --- | --- |
|`git branch`|List local branches|
|`git branch -a`|List local and remote-tracking branches|
|`git branch feature/login`|Create a branch|
|`git switch feature/login`|Switch branches|
|`git switch -c feature/login`|Create and switch|
|`git branch -d feature/login`|Delete a merged branch|
|`git branch -D feature/login`|Force-delete a branch|

### Typical feature workflow



```Bash
# Start from main
git switch main
git pull

# Create a feature branch
git switch -c feature/login

# Make changes, then commit
git add .
git commit -m "Add login feature"

# Publish the branch
git push -u origin feature/login
```

After review, merge the feature into `main` through your team's chosen workflow (often a pull request).

## 6. Remote repositories

A remote is a named reference to another repository, often hosted on GitHub or GitLab.

|Command|Purpose|
| --- | --- |
|`git remote -v`|List remote URLs|
|`git remote add origin URL`|Add a remote|
|`git remote set-url origin URL`|Change remote URL|
|`git fetch`|Download remote updates without integrating|
|`git pull`|Fetch and integrate updates|
|`git push`|Upload commits|
|`git push -u origin main`|Push and set upstream|

### Fetch vs. pull

* `git fetch` updates remote-tracking references but doesn't merge changes into your current branch.

* `git pull` fetches and then integrates changes into your current branch, typically by merging or rebasing depending on configuration and options.

## 7. Undo changes safely

This is one of the most important Git topics. Different commands affect different areas.

|Command|Effect|
| --- | --- |
|`git restore file.js`|Discard unstaged changes to a tracked file|
|`git restore --staged file.js`|Unstage a file, keeping its working changes|
|`git commit --amend`|Replace the latest commit|
|`git revert <commit>`|Create a new commit that reverses another commit|
|`git reset --soft HEAD~1`|Undo last commit, keep changes staged|
|`git reset --mixed HEAD~1`|Undo last commit, keep changes unstaged|
|`git reset --hard HEAD~1`|Reset commit and tracked working files; destructive|

Be careful: `git restore` and `git reset --hard` can discard work. Check `git status` and make a backup before using destructive commands.

### Undo the last commit but keep your work



```Bash
git reset --soft HEAD~1
```

### Undo a commit that has already been shared



```Bash
git revert <commit-hash>
git push
```

For shared history, `revert` is generally safer than rewriting commits that other people may already have pulled.

## 8. Merge and rebase

|Command|Purpose|
| --- | --- |
|`git merge feature/login`|Merge a branch into current branch|
|`git merge --abort`|Abort an in-progress merge|
|`git rebase main`|Replay current branch commits on top of `main`|
|`git rebase --continue`|Continue after resolving conflicts|
|`git rebase --abort`|Abort a rebase|

### Merge workflow



```Bash
git switch main
git merge feature/login
```

### Rebase workflow



```Bash
git switch feature/login
git fetch origin
git rebase origin/main
```

Rebase rewrites commit IDs. Avoid rebasing commits that others depend on unless your team has agreed on that workflow.

## 9. Resolve merge conflicts

A conflict happens when Git cannot automatically reconcile changes.

Example:

```
<<<<<<< HEAD
const color = "blue";
=======
const color = "red";
>>>>>>> feature/theme
```

How to resolve:

1. Open the conflicted file.

2. Decide which content to keep or combine.

3. Remove the conflict markers.

4. Stage the resolved file.

5. Finish the merge or rebase.



```Bash
git add style.js
```

For a merge:



```Bash
git merge --continue
```

For a rebase:



```Bash
git rebase --continue
```

VS Code provides buttons such as Accept Current, Accept Incoming, and Accept Both in its merge-conflict editor. Review the resulting code before staging it.

## 10. Git log and history

|Command|Purpose|
| --- | --- |
|`git log`|Full commit history|
|`git log --oneline`|Compact history|
|`git log --graph --all --oneline`|Branch graph|
|`git show <commit>`|Inspect a commit|
|`git show --stat <commit>`|Show files changed|
|`git diff main..feature/login`|Compare branches|
|`git blame app.ts`|Show who last changed each line|

Useful for tracking down when a bug or change was introduced.

## 11. Stash temporary work

Use stash when you need to switch branches but aren't ready to commit your current changes.



```Bash
# Save tracked and staged changes
git stash

# Include untracked files too
git stash -u

# List saved stashes
git stash list

# Apply latest stash and keep it in stash list
git stash apply

# Apply latest stash and remove it from stash list
git stash pop

# Delete a stash
git stash drop
```

Stash is temporary storage, not a replacement for commits or backups.


## 12. `.gitignore`

A `.gitignore` file tells Git which untracked files to ignore.

Example for a Java + web project:

gitignore

```
# Java
*.class
target/
build/

# Node.js
node_modules/
dist/

# Environment secrets
.env
.env.local

# IDE settings
.idea/
.vscode/

# OS files
.DS_Store
Thumbs.db
```

Important: `.gitignore` does not automatically untrack files already committed.

To stop tracking a file while keeping it on your computer:



```Bash
git rm --cached .env
git commit -m "Stop tracking environment file"
```

To remove a tracked directory from the index:



```Bash
git rm -r --cached node_modules/
```

## 13. Tags and releases

Tags identify specific commits, often used for releases.



```Bash
# List tags
git tag

# Create a lightweight tag
git tag v1.0.0

# Create an annotated tag
git tag -a v1.0.0 -m "Release 1.0.0"

# Push a tag
git push origin v1.0.0

# Push all tags
git push --tags
```

Annotated tags are generally useful for marking releases.

## 14. Troubleshooting common problems

Problem: `git pull` refuses because of local changes

Inspect and save your work first:



```Bash
git status
git diff
git stash -u
git pull
git stash pop
```

Resolve any conflicts if they occur.

Problem: A local extra file wasn't deleted by `git pull`

Git generally does not delete untracked files just because they are absent from the remote branch.

Check:



```Bash
git status --short
```

If the file is genuinely unnecessary, delete it manually. For a preview of untracked and ignored files that a clean could remove:



```Bash
git clean -nd
git clean -ndX
```

`git clean -fd` removes untracked files; `git clean -fdX` removes ignored files. Review carefully before running either.

Problem: I committed to the wrong branch

If the commit is local and you have not pushed it, you can create a branch at that commit:



```Bash
git branch feature/my-work
```

Then switch to that branch. If you need to remove the commit from the original branch, inspect the history and use an appropriate reset or revert.

Problem: I accidentally staged a file



```Bash
git restore --staged file.js
```

This removes it from the staging area without discarding its working changes.

## 15. Git command quick reference
```
Setup & repositories

git init

Create repository

git clone URL

Clone repository

git status

Check working tree

git config --list

View configuration

Changes & commits

git add .

Stage changes

git diff

Unstaged diff

git diff --staged

Staged diff

git commit -m "message"

Commit staged changes

git log --oneline

Compact history

Branches

git branch

List branches

git switch -c name

Create and switch

git switch main

Switch branch

git merge name

Merge branch

Remote

git remote -v

List remotes

git fetch

Fetch updates

git pull

Fetch and integrate

git push

Push commits

Undo & recovery

git restore file

Discard unstaged changes

git restore --staged file

Unstage file

git revert HASH

Reverse commit

git stash -u

Stash incl. untracked files
```
## 16. A daily Git workflow for your projects

For your HTML/CSS/JS/TS projects, a common feature-branch workflow looks like this:



```Bash
# 1. Start from an updated main branch
git switch main
git pull

# 2. Create a feature branch
git switch -c feature/navbar

# 3. Check your changes
git status
git diff

# 4. Stage and commit
git add index.html style.css app.ts
git diff --staged
git commit -m "Add responsive navbar"

# 5. Publish your branch
git push -u origin feature/navbar

# 6. Open a pull request on your Git hosting platform
# Review, merge, then update your local main branch
git switch main
git pull
```

## 17. Test your Git knowledge
```
Question 1 / 5

0 answered

What does `git add` do?

Uploads files to GitHub

Stages changes for a commit

Creates a commit

Previous

Next
```
My advice: For now, become comfortable with `status`, `add`, `commit`, `switch`, `pull`, `push`, `diff`, and `log`. Then practice branches, merge conflicts, and undo operations in a test repository before using destructive commands on important projects.
