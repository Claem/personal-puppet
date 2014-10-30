class users::users::claem {
  include 'users::util'

  #My non-root account I use everywhere
  user_acct {'claem':
    fullname    => 'claem',
    recursehome => true,
  }

  file { '/home/claem/.vimrc':
    ensure  => link,
    target  => '/home/claem/.vim/.vimrc',
    owner   => 'claem',
    group   => 'claem',
    require => User_acct['claem'],
  }
  
  exec { "bash -x /home/claem/.homedir/setup.sh":
    cwd    => '/home/claem/.homedir',
    user   => 'claem',
    group  => 'claem',
    require => User_acct['claem'],
  }
}

