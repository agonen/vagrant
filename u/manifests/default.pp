include redis

class { 'elasticsearch':
  version => '1.7.2'
}

$config_hash = {
  'ES_HEAP_SIZE' => '500m',
  'node.name' => 'es1.tps.cyber.local',
  'node.routing' => 'es1.tps.cyber.local_1'
}



elasticsearch::instance { 'es':
  config => { },        # Configuration hash
  init_defaults => $config_hash, # Init defaults hash
}

#elasticsearch::python { 'rawes': }


class { 'redis::install': }

include apt

class { 'python' :
  version    => 'system',
  pip        => true,
  dev        => true,
  virtualenv => true,
  gunicorn   => false,
}

python::requirements { '/vagrant/manifests/python_packages.txt':
}




include git

include git::subtree


git::config { 'user.name':
  value => 'amihayg',
}

git::config { 'user.email':
  value => 'amihay.gonen@verint.com',
}

# Setup Dev database
postgresql::server::db { 'tps':
  user     => 'tpsu',
  password => postgresql_password('tpsu', 'tpsu'),
}


class {'postgresql::globals':
  manage_package_repo => true,
  encoding => 'UTF8',
  locale  => 'en_US.utf8',
  version => '9.4'
}->
class { 'postgresql::server':
  listen_addresses => '*',
 postgres_password => 'postgres',
}

postgresql::server::pg_hba_rule { 'allow application network to access app database':
  description => "Open up postgresql for access from 200.1.2.0/24",
  type => 'local',
  database => 'tps',
  user => 'all',
  auth_method => 'trust',
  order => '000'
}
# Install contrib modules
class { 'postgresql::server::contrib':
  package_ensure => 'present',
}
