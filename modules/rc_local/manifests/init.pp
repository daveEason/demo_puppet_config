# /etc/puppet/modules/rc_local/manifests/init.pp

class rc_local {

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

    file { '/etc/rc.d/rc.local':
	ensure	=> present,
	owner 	=> 'root',
	group 	=> $admin_group,
	mode 	=> '0755',
	source => "puppet:///modules/rc_local/rc.local",
    }
}
