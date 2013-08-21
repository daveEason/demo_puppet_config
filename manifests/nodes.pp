# /etc/puppet/manifests/nodes.pp

node base_node {
	include sudo
	include hosts
	include ntp
	include disable_selinux
	include disable_firewall
	include disable_swappiness
}

node 'cloudera.demo0.com' inherits base_node {
	#TODO: include cloudera manager install components
	include wget
}

node 'cloudera.demo1.com' inherits base_node {
}

node 'cloudera.demo2.com' inherits base_node {
}
