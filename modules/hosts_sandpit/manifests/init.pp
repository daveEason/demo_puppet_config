# /etc/puppet/modules/hosts_sandpit/manifests/init.pp

class hosts_sandpit {

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

    file { '/etc/hosts':
	ensure	=> present,
	owner 	=> 'root',
	group 	=> $admin_group,
	mode 	=> '0644',
	source => "puppet:///modules/hosts_sandpit/hosts",
    }
}
