# /etc/puppet/modules/disable_firewall/manifests/init.pp

class disable_firewall {

    # Disable ip6tables firewall
    service { 'ip6tables':
      ensure => 'stopped',
      enable => 'false',
    }

    # Disable iptables firewall
    service { 'iptables':
      ensure => 'stopped',
      enable => 'false',
    }  
}
