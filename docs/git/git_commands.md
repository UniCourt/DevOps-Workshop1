# Setting up Git:
<hr>

## Configure git:
After installing git, to start using git from your computer, you must enter your credentials to identify 
yourself as the author of your work. The username and email address should match the ones 
you use in GitHub.

Add your username:

    git config --global user.name "your_username"

Add your email address:

    git config --global user.email "your_email_address@example.com"

To check the configuration, run:

    git config --global --list

Add ssh keys to your GitHub account:

    1. ssh-keygen -t ed25519 -C  "your_email"
    2. cat ~/.ssh/id_ed25519.pub
    3. Visit this url: https://github.com/settings/ssh/new. Paste the key and save.
<hr>

## Fork a repository
Forking refers to making a copy of a project you want to contribute to. 
Now lets fork a project provided to complete this activity. 

Follow these steps to fork a project:

1. Go to the project url using this link: https://github.com/UniCourt/Search-Workshop1
2. Click on the fork button in the project page
3. Select a namespace to fork the project.
<hr>

## Clone a repository
Cloning a repository means the files from the remote repository are downloaded to your computer, 
and a connection is created.

This connection requires you to add credentials. There are two ways to add credentials SSH and HTTPS. 
We will be using SSH here.

Authenticate with GitHub by following the instructions in the SSH documentation.

1. Go to your project’s landing page and click Clone.
2. Copy the URL for Clone with SSH.
3. Open a terminal and go to the directory where you want to clone the files. Run this command:

        git clone <url_to_clone>
<hr>

## View your remote repositories
To view the remote repositories that you have added, run following command:
    cd <repo_name>
    git remote -v
<hr>

## Configuring remote repositories

We now need to configure our local system to the remote repositories in the git. 
Generally two remote repositories are maintained origin and upstream. 
- Origin is a clone of your forked repository, from which you push and pull.
- Upstream is the repository you forked the repository from.

Since you cloned your repo from GitHub you should already have a remote called origin.

Run the following command to add an upstream repository and view it.

    git remote add upstream <upstream_clone_url>
    git remote -v
<hr>

## Create a branch
Branches allow you to develop features, fix bugs, or safely experiment with new ideas in a 
contained area of your repository. You always create a branch from an existing branch. Typically, 
you might create a new branch from the default branch of your repository.


To create a new branch called test run the following command:

    git checkout -b test


To switch to an existing branch we use the following command:

    git checkout <branch_name>
<hr>

## Download the latest changes in the project
To get an up-to-date copy of the project, we use pull command. This gets all the changes 
made to the repository, since the last clone or pull. 

To get all the latest updates run the following command:

    git pull upstream <branch_name>
<hr>

## View the changed files 
This command displays the state of the working directory and the staging area.
To check all the files you have changed run following command.

    git status
<hr>

## Stage the local changes
We use git add to add all/required files that are changed to the staging area.
To stage a file that you have changed for commit run following command:

    git add <file_name>

To stage all files in the current directory and subdirectory, we can use following command:

    git add .
<hr>

## Commit the staged files:
The git commit command creates a snapshot of all the staged changes in the project history.
Now to commit all the changes that are made run the following command:

    git commit -m "message"
The message in the commit command must describe the intention of your commit.
<hr>

## Send the changes to the remote repository
Push command sends all the committed changes to the remote repository. To push all your changes to the remote repository run the following command:

    git push origin <branch_name>

To push your changes

    git push origin exercise

You can now go to github.com and see the updated code in your browser.
<hr>

## Create a pull request:
Pull request is the process of merging the changed version of code to its original version. A pull request allows us to visualize the differences between the original code and our proposed code changes. 

Steps to create a pull request:
1. When we push changes to the remote repository, git prompts us with a link to create a merge request. We can copy-paste the link in the browser or create a new pull request from the project page in the browser.

2. Then select the base branch and compare branch that needs to be merged. The base branch is the one that has your changes and the compare branch is the original branch.

3. Add proper title, description and submit the merge request.
<hr>