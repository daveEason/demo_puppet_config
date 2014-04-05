# /etc/puppet/manifests/nodes.pp

node base_node {
	include sudo
	include ntp
	include disable_selinux
	include disable_firewall
	include disable_swappiness
}

node 'demo0.cloudera.com' inherits base_node {
	#TODO: include cloudera manager install components
	include wget
	include hosts_demo
}

node 'demo1.cloudera.com' inherits base_node {
	include hosts_demo
}

node 'demo2.cloudera.com' inherits base_node {
	include hosts_demo
}

node 'sandpit3.cloudera.com' inherits base_node {
	#TODO: include cloudera manager install components
	include wget
	include hosts_sandpit
}

node 'sandpit4.cloudera.com' inherits base_node {
	include hosts_sandpit
}

node 'sandpit5.cloudera.com' inherits base_node {
	include hosts_sandpit
}
