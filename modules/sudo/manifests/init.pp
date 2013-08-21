# /etc/puppet/modules/sudo/manifests/init.pp

class sudo {

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

    package { 'sudo': ensure => 'present'}

    file { '/etc/sudoers':
	ensure	=> file,
        owner   => 'root',
        group   => $admin_group,
        mode    => '0440',
        source  => "puppet:///modules/sudo/sudoers",
        require => Package["sudo"],
    }
}
