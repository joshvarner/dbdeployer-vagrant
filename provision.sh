#!/bin/bash

DBD_VERSION="1.61.0"

# sudo apt-get -y install libaio1

wget -q https://github.com/datacharmer/dbdeployer/releases/download/v${DBD_VERSION}/dbdeployer-${DBD_VERSION}.linux.tar.gz
tar zxvf dbdeployer-${DBD_VERSION}.linux.tar.gz
sudo mv dbdeployer-${DBD_VERSION}.linux /usr/local/bin/dbdeployer
rm dbdeployer-${DBD_VERSION}.linux.tar.gz

dbdeployer defaults enable-bash-completion --remote --run-it
rm -f /home/vagrant/dbdeployer_completion.sh

mkdir -p /home/vagrant/opt/mysql

mkdir /home/vagrant/.dbdeployer
ln -s /vagrant/dbdeployer-downloads.json /home/vagrant/.dbdeployer/tarball-list.json

chown -R vagrant:vagrant /home/vagrant

## To add a new version/flavor
# dbdeployer downloads export mylist.json
# dbdeployer downloads import mylist.json
## You have to fetch the tarball in order to get dbdeployer to SHA it and know its size when adding
# wget <tarball-url>
# dbdeployer downloads add <tarball-filename> \
#     --url <tarball-url> \
#     --flavor percona \
#     --minimal \
#     --version 5.7.32 \
#     --OS Linux
