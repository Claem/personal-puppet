class common {

  include 'common::defines'

file { '~/.vim-tmp':
  ensure => directory,
  owner  => root,
  group  => root,
  mode   => 644,
  }

}
