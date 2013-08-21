# /etc/puppet/modules/ntp/manifests/init.pp

class ntp {

# Case example
#    case $operatingsystem {
#	centos, redhat: {$servicename = 'ntpd'}
#	debian, ubuntu: {$servicename = 'ntp'}
#    }

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

    package { 'ntp': ensure => present }
    package { 'ntpdate': ensure => present }

    # ntpr.sh (custom script used to 'reset' ntp periodically)
    file { '/usr/local/src/ntpr.sh':
	ensure	=> file,
        owner   => 'root',
        group   => $admin_group,
        mode    => '0544',
        source  => "puppet:///modules/ntp/ntpr.sh",
        require => [Package['ntp'], Package['ntpdate']]
    }

    # create a symlink to ntpr.sh script
    file { '/usr/local/bin/ntpr':
	ensure	=> link,
	owner	=> 'root',
	group	=> $admin_group,
	mode	=> '0555',
	target	=> '/usr/local/src/ntpr.sh',
	require => File['/usr/local/src/ntpr.sh']
    }
}
