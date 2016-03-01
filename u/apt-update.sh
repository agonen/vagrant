#!/bin/bash
sudo apt-get install python-software-properties -y
sudo apt-get install software-properties-common -y
sudo apt-key adv --keyserver hkp://p80.pool.sks-keyservers.net:80 --recv-keys 58118E89F3A912897C070ADBF76221572C52609D
sudo /usr/bin/add-apt-repository ppa:webupd8team/java -y

echo deb http://apt.postgresql.org/pub/repos/apt/ trusty-pgdg main > /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | \
  sudo apt-key add -

wget -qO - https://packages.elastic.co/GPG-KEY-elasticsearch | sudo apt-key add -

echo "deb http://packages.elastic.co/elasticsearch/1.7/debian stable main" | sudo tee -a /etc/apt/sources.list.d/elasticsearch-1.7.list


# geting docker


echo deb https://apt.dockerproject.org/repo ubuntu-trusty main > /etc/apt/sources.list.d/docker.list

# sudo wget https://apt.puppetlabs.com/puppetlabs-release-pc1-trusty.deb
# sudo dpkg -i puppetlabs-release-pc1-trusty.deb
# sudo rm puppetlabs-release-pc1-trusty.deb
sudo add-apt-repository ppa:transmissionbt/ppa -y


sudo /usr/bin/apt-get update -y
echo debconf shared/accepted-oracle-license-v1-1 select true |  sudo debconf-set-selections
echo debconf shared/accepted-oracle-license-v1-1 seen true |  sudo debconf-set-selections

sudo /usr/bin/apt-get install -y  oracle-java8-installer

# install elasticsearch 1.7
sudo apt-get install -y  elasticsearch
sudo /usr/share/elasticsearch/bin/plugin -install knapsack -url http://xbib.org/repository/org/xbib/elasticsearch/plugin/elasticsearch-knapsack/1.7.2.0/elasticsearch-knapsack-1.7.2.0-plugin.zip
sudo /usr/share/elasticsearch/bin/plugin --install lmenezes/elasticsearch-kopf/1.0

sudo ln -s -T /vagrant_data/etc/elasticsearch /etc/elasticsearch
sudo ln -s -T /vagrant_data/etc/init.d/elasticsearch /etc/init.d/elasticsearch


sudo apt-get install transmission-gtk transmission-cli transmission-common transmission-daemon

sudo /usr/bin/apt-get install -y ipython dos2unix sqlite git python-pip vim htop iotop libpq-dev python-dev maven
sudo /usr/bin/apt-get install -y nodejs npm ipython sqlite puppet puppet-common puppet-module-puppetlabs-apt git postgresql-server-dev-9.4 redis-server, transmission-remote-cli,transmission

sudo apt-cache policy docker-engine
sudo apt-get install linux-image-extra-$(uname -r)
sudo apt-get install docker-engine -y

sudo /usr/bin/apt-get upgrade -y
sudo pip install psycopg2 --upgrade

#sudo gem install hiera
#sudo gem install hiera-puppet

#sudo puppet resource package hiera ensure=installed
#git clone --recursive https://github.com/agonen/dotphiles.git ~/.dotfiles
#git clone --recursive https://github.com/agonen/kibana-4-deb.git kibana-4-deb
updatedb

sudo ln -s /usr/bin/nodejs /usr/bin/node

sudo npm install mocha -g
# upgrade npm
sudo npm install npm -g
sudo npm install npm -g

mkdir -p  /home/vagrant/Downloads/transmission
cd   /home/vagrant/Downloads/transmission
mkdir completed incomplete torrents

sudo usermod -a -G debian-transmission vagrant
sudo chgrp -R debian-transmission /home/vagrant/Downloads/transmission
sudo chmod -R 775 /home/vagrant/Downloads/transmission

mkdir -p /home/vagrant/.config/transmission-daemon
sudo cp -a /etc/transmission-daemon/settings.json /home/vagrant/.config/transmission-daemon/
sudo chgrp -R debian-transmission /home/vagrant/.config/transmission-daemon
sudo chmod -R 770 /home/vagrant/.config/transmission-daemon

cd /etc/transmission-daemon
sudo rm settings.json 
sudo ln -s /home/vagrant/.config/transmission-daemon/settings.json settings.json
sudo chgrp -R debian-transmission /etc/transmission-daemon/settings.json
sudo chmod -R 770 /etc/transmission-daemon/settings.json
sudo cp /vagrant_data/tramissions.json /home/vagrant/.config/transmission-daemon/settings.json