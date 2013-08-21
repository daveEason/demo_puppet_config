# /etc/puppet/modules/wget/manifests/init.pp

################################################################################
# Class: wget
#
# This class will install wget - a tool used to download content from the web.
#
################################################################################

    case $::operatingsystem {
        centos: {
                $ensure_value = 'latest'
        }
        "Darwin": {
                $ensure_value = 'present'
        }
        default: {
                fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }

    class wget {
      package {'wget':
        ensure => $ensure_value }
    }  
