# /etc/puppet/modules/disable_swappiness/manifests/init.pp

class disable_swappiness {

    case $::operatingsystem {
        centos: {
                $admin_group = 'root'
        }
        "Darwin": {
                $admin_group = 'wheel'
        }
        default: {
                fail("Module ${module_name} is not supported on ${::operatingsystem}")
        }
    }

    file { '/etc/sysctl.conf':
	ensure	=> present,
	owner 	=> 'root',
	group 	=> $admin_group,
	mode 	=> '0644',
	source => "puppet:///modules/disable_swappiness/sysctl.conf",
    }
}
