include apt

class { 'elasticsearch':
  version => '1.7.2'
}

$config_hash = {
  'ES_HEAP_SIZE' => '1g',
  'node.name' => 'es1.tps.cyber.local',
  'node.routing' => 'es1.tps.cyber.local_1'
}

elasticsearch::instance { 'es':
  config => $config_hash,        # Configuration hash
  init_defaults => { }, # Init defaults hash
}



elasticsearch::plugin{'lmenezes/elasticsearch-kopf/1.0':
  instances  => 'es'
}
#elasticsearch::python { 'rawes': }

elasticsearch::plugin{ 'knapsack':
  url        => 'http://xbib.org/repository/org/xbib/elasticsearch/plugin/elasticsearch-knapsack/1.7.2.0/elasticsearch-knapsack-1.7.2.0-plugin.zip',
  instances  => 'es'
}

elasticsearch::template { 'alerts-template':
  file => '/vagrant_data/alerts-template.json'
}