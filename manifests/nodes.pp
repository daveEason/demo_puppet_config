# /etc/puppet/manifests/nodes.pp

node base_node {
	include sudo
	include hosts
	include ntp
	include disable_selinux
	include disable_firewall
	include disable_swappiness
}

node 'demo0.cloudera.com' inherits base_node {
	#TODO: include cloudera manager install components
	include wget
}

node 'demo1.cloudera.com' inherits base_node {
}

node 'demo2.cloudera.com' inherits base_node {
}
