---
title: Setting up an Oracle VM for testing the Oracle Enhanced Adapter
date: 2013-07-23
tags:
---

Oracle + Rails developers whose development machine is a Mac (myself included) have found it difficult to set up a good environment for testing the Oracle Enhanced Adapter, because Oracle no longer provides Mac installers for Oracle 11g.  It's possible to set up a virtual environment for running tests, but there isn't much documentation available to help developers set one up.  I've documented my Oracle VM setup here:

1. Install ruby & rubygems (I use [RVM](http://rvm.io/rvm/install))

2. Install [virtualbox](https://www.virtualbox.org/) & [vagrant](http://www.vagrantup.com/)

3. Install [git](http://git-scm.com/book/en/Getting-Started-Installing-Git)

4. Clone [Hilverd Reker's](https://github.com/hilverd) Oracle Vagrant project:

        git clone https://github.com/hilverd/vagrant-ubuntu-oracle-xe.git

    1. This project uses Puppet for provisioning, so install that

            gem install puppet

    2. You also need to install the [vbguest](https://github.com/dotless-de/vagrant-vbguest) Vagrant plugin

            vagrant plugin install vagrant-vbguest

5. Download [Oracle XE 11g](http://www.oracle.com/technetwork/products/express-edition/downloads/index.html) and put the file in vagrant-ubuntu-oracle-xe/modules/oracle/files/

6. Install [Oracle Instant Client](http://www.oracle.com/technetwork/database/features/instant-client/index-097480.html)

7. Run `vagrant up`

Now you have an Oracle 11g instance to use for testing.  To set up your VM & environment to run oracle_enhanced_adapter tests:

1. Create the test user/schema as described in the [testing readme](https://github.com/rsim/oracle-enhanced/blob/master/RUNNING_TESTS.md#running-tests)

2. Set environment variables so the test suite knows how to connect to the database

        export DATABASE_NAME='XE'
        export DATABASE_HOST='localhost'
        export DATABASE_PORT='1521'
        export DATABASE_SYS_PASSWORD='manager'

3.  Run `rake spec`