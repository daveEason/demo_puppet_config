# /etc/puppet/modules/users/manifests/init.pp

class users {

  user { deason:
    ensure            =>  'present',
    uid               =>  "500",
    gid               =>  deason,
    shell             =>  '/bin/bash',
    home              =>  "/home/deason",
    comment           =>  "David Eason",
    managehome        =>  true,
    groups            => ['hdfs','wheel'], 
    require           =>  Group[deason],
  }
 
  group { deason:
    gid               =>  "500" 
  }
 
  file { "/home/deason":
    ensure            =>  directory,
    owner             =>  deason,
    group             =>  deason,
    mode              =>  0750,
    require           =>  [ User[deason], Group[deason] ],
  }
}
