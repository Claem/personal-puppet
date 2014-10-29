filebucket { main: server => puppet }


Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

node default {
  include 'common'
  include 'users::users::claem'
  include 'puppet'
  include 'tools'
}

node 'NFS' inherits default {
  #include 'nginx'
  #include 'icinga'
  #include 'virtualbox'
  #include 'phpvirtualbox'
}


#node 'barghest' inherits default {
#  include 'minecraft'
#}

