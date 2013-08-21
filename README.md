
-----------------------------------------------------

WELCOME
=======
This is a really simple Puppet configuration that I use for setting up Centos servers prior to installing CDH.

INSTALLATION
============

For details on installing Puppet please refer to:
http://docs.puppetlabs.com/

Another useful (abriged) installation guide can be found here:
http://www.6tech.org/2013/01/how-to-install-puppet-open-source-on-centos-6-3/

TESTING
=======

Each Puppet module contains it's own unit test recipe that can be exercised as follows:

Master node test (tests individual <module_name>):

@master# > puppet apply --noop $puppet_home/modules/<module_name>/tests/init.pp

Agent node test (test entire node configuration):

@agent# > puppet agent --test --verbose --noop


ADDITIONAL RESOURCES
====================
Everything you need to know about getting started with the Cloudera CDH distribution
(including Apache Hadoop) can be found here: http://www.cloudera.com

Why Cloudera:
http://www.cloudera.com/content/cloudera/en/why-cloudera.html

Download CDH & Cloudera Manager:
https://ccp.cloudera.com/display/SUPPORT/Downloads
