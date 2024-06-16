# Introduction to GIT:
<hr>

## What is git?
Git is a free and open-source distributed version control system designed to handle projects with speed and efficiency. 

Real-life projects generally have multiple developers working in parallel and the code in Git keeps changing as more code is added by developers. Git helps us with the following features:
- Maintain history of what changes have happened
- Ensures no conflicts between developer’s codes
- Revert or bo back to previous versions
<hr>

## Git terminologies:
1. ### Repository:
    A repository is similar to how you store files in a folder or directory on your computer. In GitLab, files are stored in a repository. A remote repository refers to the files in GitLab and a local copy refers to the files on your computer.

2. ### Branch:
    In Git, a branch is a pointer to a specific commit. It can be considered as an independent line of development to isolate our work from other team member’s work.
3. ### Fork:
    Fork is nothing but a copy of a project present in git. When we want to contribute to someone else’s project, we make a copy of it in our own namespace.
4. ### Clone:
    Cloning/downloading is the process of creating a copy of a remote repository’s files on our computer. 

    The only difference between download and clone is that, if we download a repository we cannot sync the repository with the remote repository on git. 

    But if we clone, it preserves the git connection and we can upload the changes in the local file to the remote repository.
5. ### Push:
    After changes are made to the local copy of a repository we can upload the changes to the remote repository using the push feature.
6. ### Pull:
    When the remote repository changes, our local copy is left behind. We can update our local copy with the new changes in the remote repository using the pull feature.
<hr>

## General git flow:
![git flow](gitflow.png)

Initially we create a local copy of the remote repository using git clone/pull to get copy/latest updates made to the repository.

Once we make changes to the local copy we need to add the modified files to the staging area using git add so that the git tracks the changes made to the files.

Then we commit the changes made to the local git repository. Each commit in git records a snapshot of the state of the full repository along with the name, timestamp, and message of the committer.

The changes committed in the local repository can be sent to the remote repository with the git push command. This command pushes all the committed changes to the remote repository.
<br><hr>                                 
[`Introduction to Git`](prerequisites/introduction_to_git.md)