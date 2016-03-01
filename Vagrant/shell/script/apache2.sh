#!/bin/bash
sudo apt-get -y update
sudo apt-get -y install apache2 git zip maven

sudo service apache2 stop
cd /etc/apache2/mods-available && sudo a2enmod proxy_ajp && sudo a2enmod proxy
sudo rm -rf /etc/apache2/sites-available/* && sudo rm -rf /etc/apache2/sites-enabled/*
sudo rm -rf /var/www/* && sudo cp /vagrant/files/index.html /var/www/ && chown -R www-data:www-data /var/www/ && chmod 755 -R /var/www/
sudo cp -R /vagrant/files/manutencao/ /var/www/ && chown -R www-data:www-data /var/www/ && chmod 755 -R /var/www/
cp /vagrant/files/sites/*.conf /etc/apache2/sites-available/
cd /etc/apache2/sites-available/ && sudo a2ensite manutencao.conf
sudo rm -rf /etc/apache2/apache2.conf && sudo cp /vagrant/files/apache2.conf /etc/apache2/
sudo service apache2 start
exit
