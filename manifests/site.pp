class { 'apt': 
  always_apt_update => true,
}

# Always update packages before installing one
Class['apt'] -> Package<||>

# Configure apache
class { 'apache':
  mpm_module    => 'prefork', # needed to install php
  default_vhost => false,
  default_mods  => true,
}

class { 'apache::mod::php': }

# Usually needed
apache::mod { 'rewrite': }

# Configure vhost
apache::vhost { "webserver":
    port     => 80,
    docroot  => "/webserver",
    override => "All",
}

# Configure mysql
class { '::mysql::server':
  root_password => 'root',
}

# Link mysql with php
class { 'mysql::bindings':
  php_enable => true,
  notify     => Service['apache2'],
}





