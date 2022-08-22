## Conditionals and Loops

### Step 1 - Conditionals

Ansible can use conditionals to execute tasks or plays when certain conditions are met.

To implement a conditional, the when statement must be used, followed by the condition to test. The condition is expressed using one of the available operators like e.g. for comparison:


## Schedule
| Operator                    | Description 
| ----------------------- |-------
| ==                      |  Compares two objects for equality.
| !=                      |  Compares two objects for inequality.
| >                       |  true if the left hand side is greater than the right hand side.
| >=                      |  true if the left hand side is greater or equal to the right hand side.
| <                       |  true if the left hand side is lower than the right hand side
| <=                      |  true if the left hand side is lower or equal to the right hand side.

 	 
As an example you would like to pull only particular version of a docker image, edit your `localhost.yaml` present in host vars directory

```
---
image: postgres
version:1.0
```

Now edit your playbook to pull the image only when version is 1.0

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
     shell:
       cmd: "docker pull {{ image }}"
     when: version == "1.0"
```

## Step 2 - Simple Loops

Loops enable us to repeat the same task over and over again. For example, lets say you want to pull multiple images. By using an Ansible loop, you can do that in a single task. Loops can also iterate over more than just basic lists. For example, if you have a list of users with their corresponding group, loop can iterate over them as well. Find out more about loops in the Ansible Loops documentation.

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
     shell:
       cmd: "docker pull {{ item }}"
     loop:
     - postgres
     - alpine
```

## Step 3 - Loops over hashes

As mentioned loops can also be over lists of hashes

Let’s rewrite the playbook to pull the images with different versions

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
     shell:    
       cmd: "docker pull {{ item.name }}:{{ item.version }}"
     loop:
         - {name: postgres, version: 1.0}
         - {name: alpine, version: 2.0}
```
___

[Home](../README.md)