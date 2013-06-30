# vagrant-fpm-kitchen

Some glue that automates using [Vagrant](http://www.vagrantup.com) anpd
[fpm-cookery](https://github.com/bernd/fpm-cookery) to build packages. The
example `Vagrantfile` uses Ubuntu 12.04 LTS and creates .deb packages.

Recipes for the latest ruby 1.9.3 and 2.0.0 are included. More recipes can be
found at [bernd/fpm-recipes](https://github.com/bernd/fpm-recipes)

## Installation

First you'll need to install Vagrant, which has [excellent
documentation](http://docs.vagrantup.com/v2/installation/index.html).

Then clone this repository.

## Full-auto building and package creation

If you just want to build and package some software, it's as simple as

    cd ~/path/to/vagrant-fpm-kitchen
    vagrant up

This will build a fresh Vagrant virtual machine and run the build-packages shell
script during the provisioning phase, which builds a package for ruby 2.0.0. If
all goes well you'll have a .deb in `recipies/ruby/pkg` when it completes.

For more information, see the step-by-step directions below, check out the
`Vagrantfile` and the `build-packages` script.

## More detailed step-by-step usage

Create your Vagrant virtual machine without running the automated build-packages
script:

    cd ~/path/to/vagrant-fpm-kitchen
    vagrant up --no-provision

Once the virtual machine has been created, ssh into the machine:

    vagrant ssh

Install the fpm-cookery gem inside the virtual machine:

    cd /vagrant
    ./setup-fpm-cookery

Build and package ruby 2.0.0:

    cd recipes
    sudo fpm-cook install-deps ruby/2.0.0.rb
    fpm-cook ruby/2.0.0.rb

