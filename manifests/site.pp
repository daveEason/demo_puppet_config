# /etc/puppet/manifests/site.pp

import "nodes"

# The filebucket option allows for file backups to the server
filebucket { main: server => puppet }

# global defaults
File { backup => main }

