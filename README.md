# Template for local development environment

This template sets up a Vagrant virtual machine with the following installed:

* ubuntu/groovy64 
* nginx 
* PHP 7.2
* MySQL with `root` as the password for the user `root`.
* composer
* NPM

There is no “scaffolding” for the web project, only the local environment. See step 7.

This project creates a virtual machine at the IP address `192.168.33.11`. If you want to use another IP address, update the `etc/hosts` file and `Vagrantfile` before running `vagrant up`.

This project uses the domain `sandbox.test`. If you want to use another domain replace all instances of `sandbox.test` with the desired domain in the instructions below. 

### 1. Click `Use this template` and create a new project git repo

### 2. Clone your new project to your local computer.

```
git clone [github URL] [local directory name]
```

### 3. Add to `etc/hosts`
```
192.168.33.11 sandbox.test
```

### 4. Install VirtualBox and Vagrant
* https://www.virtualbox.org/
* https://www.vagrantup.com/

### 5. Add the Ubuntu vagrant box to your computer.
```
vagrant box add ubuntu/groovy64
```


### 6. Provision Vagrant
```
vagrant up
```

### 7. Include a submodule site repo. (optional)

If you already have a working project, you can include it as a submodule. If you are creating a new web project that will be deployed to another environment, you should create that git repo first and include it as a submodule.
```
git submodule add [github URL] sandbox.test
```

You can make a new site repo from this template:
* https://github.com/texasbaptists/new-local-dev

### 8. SSH into the Vagrant server and configure the domain for nginx

```
vagrant ssh
sudo /var/www/site-config sandbox.test
exit

```

Notes: 
* If no directory has been made for the domain, this script will create it with a default `index.php` file. 
* The root of the domain will be to the `public` directory in the domain folder.