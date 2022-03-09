## Running Ad Hoc Commands

### Objective

For our first exercise, we are going to run some ad-hoc commands to help you get a feel for how Ansible works. Ansible Ad-Hoc commands enable you to perform tasks on remote nodes without having to write a playbook. They are very useful when you simply need to do one or two things quickly and often, to many remote nodes.

This exercise will cover

- Locating and understanding the Ansible configuration file (ansible.cfg)
- Locating and understanding an ini formatted inventory file
- Executing ad hoc commands

### Step 1 - Work with your Inventory

To use the ansible command for host management, you need to provide an inventory file which defines a list of hosts to be managed from the control node. In this workshop the inventory is provided by your instructor. The inventory is an ini formatted file listing your hosts, sorted in groups, additionally providing some variables. It looks like:

```
all:
  hosts:
    mail.example.com:
  children:
    webserver:
      hosts:
        foo.example.com:
          ansible_connection: local
    dbservers:
      hosts:
        bar.example.com:
          ansible_connection: local

```

To reference inventory hosts, you supply a host pattern to the ansible command. Ansible has a --list-hosts option which can be useful for clarifying which managed hosts are referenced by the host pattern in an ansible command.

```
[student<X>DevOps-Workshop1]$ ansible webserver --list-hosts
  hosts (1):
    foo.example.com
```
An inventory file can contain a lot more information, it can organize your hosts in groups or define variables. In our example, the current inventory has the groups web and control. Run Ansible with these host patterns and observe the output:

```
[student<X>DevOps-Workshop1]$ ansible webserver  --list-hosts
[student<X>DevOps-Workshop1]$ ansible dbservers --list-hosts
```

### Step 2 - The Ansible Configuration Files

The behavior of Ansible can be customized by modifying settings in Ansible’s ini-style configuration file. Ansible will select its configuration file from one of several possible locations on the control node

An `ansible.cfg` file has already been created and filled with the necessary details in `/etc/ansible/ansible.cfg`

There might be multiple configuration flags provided. Most of them are not of interest here, but make sure to note the last line: there the location of the inventory is provided. That is the way Ansible knew in the previous commands what machines to connect to.

### Step 3 - Ping a host

Let’s start with something really basic - pinging a host. To do that we use the Ansible ping module. The ping module makes sure our target hosts are responsive. Basically, it connects to the managed host, executes a small script there and collects the results. This ensures that the managed host is reachable and that Ansible is able to execute commands properly on it.

Ansible needs to know that it should use the ping module: The -m option defines which Ansible module to use. Options can be passed to the specified modul using the -a option.

```[student<X>DevOps-Workshop1]$ ansible webserver -m ping
node2 | SUCCESS => {
    "ansible_facts": {
        "discovered_interpreter_python": "/usr/bin/python"
    },
    "changed": false,
    "ping": "pong"
}
[...]
```

### Step 4 - Listing Modules and Getting Help

Ansible comes with a lot of modules by default. To list all modules run:

`[student<X>DevOps-Workshop1]$ ansible-doc -l`

To find a module try e.g.:

`[student<X>DevOps-Workshop1]$ ansible-doc -l | grep -i user`

Get help for a specific module including usage examples:

`[student<X>DevOps-Workshop1]$ ansible-doc user`

### Step 5 - Use the command module

Now let’s see how we can run a good ol’ fashioned Linux command and format the output using the command module. It simply executes the specified command on a managed host:

`ansible webserver -m command -a "id"`

In this case the module is called command and the option passed with -a is the actual command to run. Try to run this ad hoc command on all managed hosts using the all host pattern.

Another example: Have a quick look at the kernel versions your hosts are running:

`[student<X>DevOps-Workshop1]$ ansible all -m command -a 'uname -r'`

### Step 6 - The copy module and permissions

Using the copy module, execute an ad hoc command on node1 to change the contents of the /etc/motd file. The content is handed to the module through an option in this case.

`[student<X>DevOps-Workshop1]$ ansible webserver -m copy -a 'content="Managed by Ansible\n" dest=/etc/motd'`

As mentioned this produces an error:

```
    node1 | FAILED! => {
        "changed": false,
        "checksum": "a314620457effe3a1db7e02eacd2b3fe8a8badca",
        "failed": true,
        "msg": "Destination /etc not writable"
    }
```

The output of the ad hoc command is screaming FAILED in red at you. Why? Because user student<X> is not allowed to write the motd file.

Now this is a case for privilege escalation and the reason sudo has to be setup properly. We need to instruct Ansible to use sudo to run the command as root by using the parameter -b (think “become”).

For us it’s okay to connect as student<X> because sudo is set up. Change the command to use the -b parameter and run again:

`[student<X>DevOps-Workshop1]$ ansible webserver -m copy -a 'content="Managed by Ansible\n" dest=/etc/motd' -b`

This time the command is a success:

