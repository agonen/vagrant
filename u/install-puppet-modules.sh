#!/bin/bash
mkdir -p /etc/puppet/modules;

if [ ! -d /etc/puppet/modules/hosts ]; then
  puppet module install ghoneycutt-hosts
fi
if [ ! -d /etc/puppet/modules/git ]; then
  puppet module install puppetlabs-git
fi
if [ ! -d /etc/puppet/modules/java ]; then
    puppet module install puppetlabs-java
fi
if [ ! -d /etc/puppet/modules/python ]; then
    puppet module install stankevich-python
fi

if [ ! -d /etc/puppet/modules/vcsrepo ]; then
   puppet module install puppetlabs-vcsrepo
fi

if [ ! -d /etc/puppet/modules/apt ]; then
   puppet module install puppetlabs-apt
fi

if [ ! -d /etc/puppet/modules/redis ]; then
    puppet module install dwerder-redis
fi

if [ ! -d /etc/puppet/modules/postgresql ]; then
    puppet module install puppetlabs-postgresql
fi
if [ ! -d /etc/puppet/modules/openldap ]; then
    puppet module install camptocamp-openldap
fi

if [ ! -d /etc/puppet/modules/webmin ]; then
   puppet module install panaman-webmin
fi

if [ ! -d /etc/puppet/modules/docker ]; then
   puppet module install garethr-docker
fi

if [ ! -d /etc/puppet/modules/elasticsearch ]; then
 puppet module install elasticsearch-elasticsearch 
fi
