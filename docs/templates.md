## Templates

### Objective


This exercise will cover Jinja2 templating. Ansible uses Jinja2 templating to modify files before they are distributed to managed hosts. Jinja2 is one of the most used template engines for Python 

## Step 1 - Using Templates in Playbooks


As an example of using templates you will create a file to contain host-specific data.

First create the directory inside `ansible-files` templates to hold template resources:

`[student<X>DevOps-Workshop1/ansible_files]$ mkdir templates`

Then in the `ansible-files/templates/` directory create the template file `machine-facts.j2`:

```
Welcome to {{ ansible_hostname }}.
{{ ansible_distribution }} {{ ansible_distribution_version}}
deployed on {{ ansible_architecture }} architecture.
```
The template file contains the basic text that will later be copied over. It also contains variables which will be replaced on the target machines individually.

Next we need a playbook to use this template. In the `ansible-files` directory create the Playbook `machine-facts.yaml`:

```
---
- name: Fill the file with host data
  hosts: localhost
  become: true
  tasks:
    - template:
        src: machine-facts.j2
        dest: machine-facts.txt
        owner: root
        group: root
        mode: 0644
```
