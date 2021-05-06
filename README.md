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

### 1. Add to `etc/hosts`
```
192.168.33.11 sandbox.test
```


### 2. Provision Vagrant

```
vagrant up
```


### 3. Include a submodule site repo. (optional)

Setting up a new project as a git submodule is advisable if you plan on deploying the site to another environment. 

```
git submodule add [github URL] sandbox.test
```

You can make a new site repo from this template:
* https://github.com/texasbaptists/new-local-dev

### 4. SSH into the Vagrant server and configure the domain for nginx

```
vagrant ssh
sudo /var/www/site-config sandbox.test
exit
```

Notes: 
* If no directory has been made for the domain, this script will create it with a default `index.php` file. 
* The root of the domain will be to the `public` directory in the domain folder.