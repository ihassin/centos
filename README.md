# VM provisioning

The roles are
- common: basic centos
- secure: secured-ish centos
- ruby 2
- bundler, rubygems, Gemfile, cucumber, vagrant

# git

```
git clone git@github.com:ihassin/centos.git
```

or

```
git clone https://github.com/ihassin/centos.git
```

# Prerequisites

* Please install VirtualBox from [here](https://www.virtualbox.org/wiki/Downloads).
* Please install Vagrant from [here](https://docs.vagrantup.com/v2/installation).
* Please install Ansible from [here](http://docs.ansible.com/ansible/intro_installation.html#getting-ansible).

## Provisioning the VMs

Vagrantfile assumes a base Centos box named 'centos'. To import that box, issue the following command:

```
vagrant box add centos /path/to/box/file
```

Initialize Vagrant:

```
vagrant init
```

and change the box name to match the box file you chose.

If you want to change the VM's IP address, or networking in general, please edit Vagrantfile to suite your needs.

Once you have done that, you can ```ssh deploy@33.33.33.44``` with the password found in common/vars/main.yml
If you want to access the VM using your own ssh key, insert your public key in common/templates/ssh_keys.pub

You can then bring up the box for configuring by issuing the following command:

```
vagrant up|provision
```

# Running Ansible standalone

```
ansible-playbook -i inventory.ini playbook.yml -u root
```

# Missing steps

The playbook will install RVM and bundler but I have not figured out a way for Ansible to run

```
bundle --binstubs
```

So once Ansible has finished, please ssh to the VM as the deploy user and execute

```
install.sh
```

It will run ```bundle --binstubs``` and call ```bundle exec cucumber --init```.

From then on, you can start running cukes from that user on the VM.

# Example ServerSpec

Please see spec/devops/*_spec.rb for ServerSpec files.
Run ServerSpec by issuing the following command:

```
rake
```

# Contributing

1. Fork it (https://github.com/ihassin/centos/fork)
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

# License

MIT
