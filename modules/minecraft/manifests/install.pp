class minecraft::install { 

package { 'screen':
    ensure  => installed,
  }

package { 'default-jre':
    ensure => installed 
}

user { 'minecraft':    
    ensure  => present,
    uid     => 750,
    gid     => minecraft,
    home    => 'home/minecraft',
  }

group { 'minecraft':
    ensure  => present,
    gid     => 640,
  }


file {  '/home/minecraft/minecraft/plugins':
    ensure => directory,
    owner  => 'minecraft',
    group  => 'minecraft',
    mode   => '0600',
    source => "puppet:///modules/minecraft/home/minecraft/minecraft/plugins",
  }

  file  {  '/home/minecraft/minecraft/minecraft.sh':
    ensure  => file,
    group   => 'minecraft',
    mode    => '0711',
    source  => "puppet:///modules/minecraft/home/minecraft/minecraft/bukkit.yml",
  }

}
