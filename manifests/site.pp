filebucket { main: server => puppet }


Exec {
    path => "/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin",
}

node default {
  include 'common'
  #Broken until I figure out submodules
  include 'users::users::claem'
  include 'puppet'
  include 'tools'
}

node /^tvmobili.*/ inherits default {
  include 'tvmobili'
}

node 'NFS' inherits default {
  #include 'nginx'
  #include 'icinga'
  #include 'virtualbox'
  #include 'phpvirtualbox'
  include 'minecraft'
}


node 'barghest' inherits default {
}
