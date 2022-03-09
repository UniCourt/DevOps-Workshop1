## Variables

### Objective

Ansible supports variables to store values that can be used in Playbooks. Variables can be defined in a variety of places and have a clear precedence. Ansible substitutes the variable with its value when a task is executed.

This exercise covers variables, specifically

- How to use variable delimiters ``
- What host_vars and group_vars are and when to use them
- How to use ansible_facts
- How to use the debug module to print variables to the console window

Variables are referenced in Ansible Playbooks by placing the variable name in double curly braces:

Here comes a variable `{{ variable1 }}`

Variables and their values can be defined in various places: the inventory, additional files, on the command line, etc.

The recommended practice to provide variables in the inventory is to define them in files located in two directories named host_vars and group_vars:

- To define variables for a group “servers”, a YAML file named group_vars/servers.yml with the variable definitions is created.
- To define variables specifically for a host node1, the file host_vars/node1.yml with the variable definitions is created.

## Step 1 - Variable Files

On the ansible control host the directory `/inventory/host_vars` holds the variable definitions :

Check the file `localhost.yaml`:

```
---
image: postgres
```

## Step 2 - Update the Playbook

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
   - name: Pull the docker image
     cmd: "docker pull {{ image }}"
```

## Step 3 - Test the Result

`docker images ls | grep postgres`

## Step 4 - Ansible Facts

Ansible facts are variables that are automatically discovered by Ansible from a managed host. Remember the “Gathering Facts” task listed in the output of each ansible-playbook execution? At that moment the facts are gathered for each managed nodes. Facts can also be pulled by the setup module. They contain useful information stored into variables that administrators can reuse.

To get an idea what facts Ansible collects by default, on your control node as your student user run:

`[student<X>DevOps-Workshop1/ansible_files]$ ansible localhost -m setup`

This might be a bit too much, you can use filters to limit the output to certain facts, the expression is shell-style wildcard:

`[student<X>DevOps-Workshop1/ansible_files]$ ansible localhost -m setup -a 'filter=ansible_*_mb'`

## Step 5 - Using Facts in Playbooks

Facts can be used in a Playbook like variables, using the proper naming, of course. Update the Playbook

```
---
- name: docker installed
  hosts: localhost
  become: yes
  tasks:
  tasks:
  - name: install latest docker ce
    package:
      name: docker-ce
      state: latest
  ....       
   - name: Pull the docker image
     cmd: "docker pull {{ image }}"
   - name: Prints Ansible facts
     debug:
       msg: The default IPv4 address of {{ ansible_fqdn }} is {{ ansible_default_ipv4.address }}     
```
