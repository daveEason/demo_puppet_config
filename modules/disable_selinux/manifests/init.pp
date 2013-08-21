# /etc/puppet/modules/disable_selinux/manifests/init.pp

class disable_selinux {

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

    file { '/etc/selinux/config':
	ensure	=> file,
        owner   => 'root',
        group   => $admin_group,
        mode    => '0644',
        source  => "puppet:///modules/disable_selinux/config",
    }

    # create a symlink to config
    file { '/etc/sysconfig/selinux':
	ensure	=> link,
	owner	=> 'root',
	group	=> $admin_group,
	mode	=> '0777',
	target	=> '../selinux/config',
	require => File['/etc/selinux/config']
    }
}
