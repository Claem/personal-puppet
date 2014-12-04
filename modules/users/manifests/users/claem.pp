class users::users::claem {
  include 'users::util'

  #My non-root account I use everywhere
  user_acct {'claem':
    fullname    => 'claem',
    uid         => 5000,
    recursehome => true,
  }

  file { '/home/claem/.vimrc':
    ensure  => link,
    target  => '/home/claem/.vim/.vimrc',
    owner   => 'claem',
    group   => 'claem',
    require => User_acct['claem'],
  }
 
 exec { "git clone https://github.com/Claem/.homedir.git ${root_path}": 
     environment => 'HOME=${home_path}',
     creates     => '/home/claem/.homedir',
     user        => 'claem',
     group       => 'claem',
     require     => User_acct['claem'],
   }

  exec { "/home/claem/.homedir/setup.sh ${root_path}":
    environment => 'HOME=${home_path}',
    cwd         => '/home/claem/.homedir',
    user        => 'claem',
    group       => 'claem',
    require     => Exec { "git clone https://github.com/Claem/.homedir.git] ${root_path}":,
  }
}

