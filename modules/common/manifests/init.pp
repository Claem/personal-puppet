class common {

  include 'common::defines'  

file { '~/.vim-tmp':
  ensure => directory,
  }

}
