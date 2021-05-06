# Template for local development environment

This template sets up a Vagrant virtual machine with the following installed:

* ubuntu/groovy64 
* nginx 
* PHP 7.2
* MySQL with `root` as the password for the user `root`.
* composer
* NPM

This project creates a virtual machine at the IP address `192.168.33.11`. If you want to use another IP address, update the `etc/hosts` file and `Vagrantfile` before running `vagrant up`.

This project uses the domain `sandbox.test`. If you want to use another domain replace all instances of `sandbox.test` with the desired domain in the instructions below. 

### 1. Click `Use this template` and create a new project repo

### 2. Clone your new project to your local computer.

```
git clone [github URL] [local directory name]
```

### 3. Add to `etc/hosts`
```
192.168.33.11 sandbox.test
```

### 4. Provision Vagrant

```
vagrant up
```

### 5. Include a submodule site repo. (optional)

Setting up a new project as a git submodule is advised if you plan on deploying the site to another environment. 

```
git submodule add [github URL] sandbox.test
```

You can make a new site repo from this template:
* https://github.com/texasbaptists/new-local-dev

### 6. SSH into the Vagrant server and configure the domain for nginx

```
vagrant ssh
sudo /var/www/site-config sandbox.test
exit
```

Notes: 
* If no directory has been made for the domain, this script will create it with a default `index.php` file. 
* The root of the domain will be to the `public` directory in the domain folder.