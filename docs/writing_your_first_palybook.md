## Writing your first playbook


### Objective

While Ansible ad hoc commands are useful for simple operations, they are not suited for complex configuration management or orchestration scenarios. For such use cases playbooks are the way to go.

Playbooks are files which describe the desired configurations or steps to implement on managed hosts. Playbooks can change lengthy, complex administrative tasks into easily repeatable routines with predictable and successful outcomes.

A playbook is where you can take some of those ad-hoc commands you just ran and put them into a repeatable set of plays and tasks.

A playbook can have multiple plays and a play can have one or multiple tasks. In a task a module is called, like the modules in the previous chapter. The goal of a play is to map a group of hosts. The goal of a task is to implement modules against those hosts.

### Step 1 - Playbook Basics

Playbooks are text files written in YAML format and therefore need:

to start with three dashes (---)

proper indentation using spaces and not tabs!

For more information on YAML format: https://docs.ansible.com/ansible/latest/reference_appendices/YAMLSyntax.html

There are some important concepts: 

- hosts: the managed hosts to perform the tasks on

- tasks: the operations to be performed by invoking Ansible modules and passing them the necessary options.

- become: privilege escalation in Playbooks, same as using -b in the ad hoc command.

A Playbook should be idempotent, so if a Playbook is run once to put the hosts in the correct state, it should be safe to run it a second time and it should make no further changes to the hosts.


### Step 2 - Creating a Directory Structure and File for your Playbook

Enough theory, it’s time to create your first Ansible Playbook. In this workshop you create a playbook to set up a docker web server in three steps:

- Install docker package
- Enable/start docker service
- Pull a docker image

This Playbook makes sure the package containing the docker is installed on local machine.

On your control host ansible, create a directory called ansible-files and change directories into it:


```
[student<X>DevOps-Workshop1]$ mkdir ansible-files
[student<X>DevOps-Workshop1]$ cd ansible-files/
```

Add a file called docker.yaml` with the following content. (Use your favorite editor to create and edit the files)

```
---
- name: docker installed
  hosts: localhost
  become: yes
```

This shows one of Ansible’s strengths: The Playbook syntax is easy to read and understand. In this Playbook:

- A name is given for the play via name:.
- The host to run the playbook against is defined via hosts:.
- We enable user privilege escalation with become:.

Now that we’ve defined the play, let’s add a task to get something done. We will add a task in which package will ensure that the docker package is installed in the latest version. Modify the file so that it looks like the following listing:

```
---
- name: docker installed
  hosts: localhost
  become: yes
  tasks:
  - name: install latest docker ce
    package:
      name: docker-ce
      state: latest
  - name: install latest docker cli
    package:
      name: docker-cli
      state: latest
  - name: install latest docker containerd
    package:
      name: containerd.io
      state: latest      
```

In the added lines:

- We started the tasks part with the keyword tasks.
- A task is named and the module for the task is referenced. Here it uses the yum module.
- Parameters for the module are added:
  - name: to identify the package name
  - state: to define the wanted state of the package

## Step 3 - Running the Playbook

Ansible Playbooks are executed using the ansible-playbook command on the control node. Before you run a new Playbook it’s a good idea to check for syntax errors:


`[student<X>DevOps-Workshop1/ansible_files]$ sudo ansible-playbook --syntax-check docker.yaml`

Now you should be ready to run your playbook:

`[student<X>DevOps-Workshop1/ansible_files]$ sudo ansible-playbook docker.yaml`

The output should not report any errors but provide an overview of the tasks executed and a play recap summarizing what has been done. There is also a task called “Gathering Facts” listed there: this is an built-in task that runs automatically at the beginning of each play. It collects information about the managed nodes. Exercises later on will cover this in more detail.

check to make sure docker has been installed

`docker --version`

## Step 4 - Extend your Playbook: Start & Enable Docker

The next part of the Ansible Playbook makes sure the Docker is enabled and started.

On the control host, as your student user, edit the file `docker.yaml` to add a second task using the service module. The Playbook should now look like this:

```
---
- name: docker installed
  hosts: localhost
  become: yes
  tasks:
  - name: install latest docker ce
    package:
      name: docker-ce
      state: latest
  ....    
  - name: docker enabled and running
    service:
      name: docker
      enabled: true
      state: started      
```

Again: what these lines do is easy to understand:

- a second task is created and named
- a module is specified (service)
- parameters for the module are supplied

Thus with the second task we make sure the docker is indeed running on the target machine. Run your extended Playbook:

`[student<X>DevOps-Workshop1/ansible_files]$ sudo ansible-playbook docker.yaml`


Note the output now: Some tasks are shown as “ok” in green and one is shown as “changed” in yellow.

Use an Ansible ad hoc command again to make sure docker has been enabled and started, e.g. with: systemctl status docker.

Run the Playbook a second time to get used to the change in the output.


## Step 5 - Extend your Playbook to pull a docker image

___

[Home](../README.md)
