# Ansible Workshop

One Day workshop on understanding Ansible to automate cloud provisioning, configuration management, application deployment, intra-service orchestration, 
and many other IT needs.

## Prerequisite

##### Any Linux machine/VM with following packages installed
- [Python 3.6](https://www.python.org/downloads/source/) or above 
- [pip3](https://pip.pypa.io/en/stable/installation/)
- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git) (any recent version)

##### GitHub account
- Create an account on [GitHub](https://github.com/join) (if you don't already have one)
- Fork [this](https://github.com/UniCourt/DevOps-Workshop1) repository and then clone it to your machine
- You can refer [this](https://docs.github.com/en/get-started/quickstart/fork-a-repo) guide to understand how to fork and clone


##### Docker
- To install docker go to your cloned repository and run the following command
- `sudo prerequisites/install_docker.sh`

## What will you learn by the end of this workshop?
- By the end of this workshop you will understand what is ansible and how to install it
- You will understand how to run Ad-hoc commands via Ansible
- You will understand what are Ansible Playbooks and how to write them
- You will understand what are Ansible variables and how to use them in template
- You will have installed Docker and Docker Compose on your machine via Ansible

## Schedule
| Time                    | Topics
| ----------------------- |-------
| 09:00 - 9:30            |  [`Introduction to Git`](prerequisites/introduction_to_git.md)
| 9:30  - 10:00           |  [`What is Ansible`](/docs/what_is_ansible.md)
| 10:00 - 10:30           |  [`Intstalling Ansible`](/docs/installing_ansible.md)
| 10:30 - 11:30           |  [`Running Ad hoc commands`](/docs/running_adhoc_commands.md)
| 11:30 - 1:00            |  [`Writing your first playbook`](/docs/writing_your_first_palybook.md)
| 1:00 -  2:00            |  `Break`
| 2:00 -  2:30            |  [`Variables`](/docs/variables.md)
| 2:30 -  3:00            |  [`Conditionals and Loops`](/docs/conditionals_and_loops.md)
| 3:00 -  3:30            |  [`Templates`](/docs/templates.md)
| 3:30 -  4:30            |  `Q & A and Wrapping Up`
