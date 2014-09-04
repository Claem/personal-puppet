class users::users::claem{
  include 'users::util'

  #My non-root account I use everywhere
  user_acct {'claem':
    fullname    => "Claem Agourd",
    uid         => 1000,
    recursehome => true,
  }

  file { '/home/claem/.vimrc':
    ensure  => link,
    target  => '/home/claem/.vim/.vimrc',
    owner   => 'claem',
    group   => 'claem',
    require => User_acct['claem'],
  }
