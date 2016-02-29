#!/bin/bash
REPO="https://github.com/AnselmoPfeifer/financeiro-web-jsf.git"

#Instalar java e Tomcat git maven zip
sudo apt-get update --force-yes
sudo apt-get upgrade --force-yes
sudo apt-get -y install apache2 git zip maven --force-yes
sleep 5
cd /etc/apache2/mods-available
sudo a2enmod proxy_ajp
sudo a2enmod proxy
sudo rm cd /etc/apache2/sites-avaliable/*
cp /vagrant/files/default.conf /etc/apache2/sites-avaliable/
sudo service apache2 restart

#Instalar JAVA8
cd /usr/local && sudo mkdir /usr/local/java
cd /usr/local/java/
#64
sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-x64.tar.gz"
sudo tar -zxvf jdk-8u45-linux-x64.tar.gz
sudo rm jdk-8u45-linux-x64.tar.gz
cd jdk1.8.0_45/
sudo update-alternatives --install "/usr/bin/java" "java" "/usr/local/java/jdk1.8.0_45/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/usr/local/java/jdk1.8.0_45/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/usr/local/java/jdk1.8.0_45/bin/javaws" 1
sudo update-alternatives --set java "/usr/local/java/jdk1.8.0_45/bin/java"
sudo update-alternatives --set javac "/usr/local/java/jdk1.8.0_45/bin/javac"
sudo update-alternatives --set javaws "/usr/local/java/jdk1.8.0_45/bin/javaws"
#32
#sudo wget --no-cookies --no-check-certificate --header "Cookie: gpw_e24=http%3A%2F%2Fwww.oracle.com%2F; oraclelicense=accept-securebackup-cookie" "http://download.oracle.com/otn-pub/java/jdk/8u45-b14/jdk-8u45-linux-i586.tar.gz"
#tar -zxvf jdk-8u45-linux-i586.tar.gz

#Instalar tomcat
cd /usr/local/ && wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.zip
cd /usr/local/ && sudo unzip apache-tomcat-8.0.32.zip && sudo mv apache-tomcat-8.0.32 tomcat && cd /usr/local/tomcat/bin/ && sudo chmod +x *.sh
sudo rm /usr/local/apache-tomcat-8.0.32.zip

#Deploy
sudo mkdir /var/www/manutencao && cp /vagrant/files/index.html /var/www/manutencao/ && sudo chown www-data:www-data -R /var/www/manutencao
cd /etc/apache2/sites-avaliable/
cp /vagrant/files/manutencao.conf /etc/apache2/sites-avaliable/
sudo a2ensite manutencao.conf
sudo a2dissite default.conf
sudo service apache2 reload
sudo sh /usr/local/tomcat/bin/shutdown.sh
sudo rm -rf /usr/local/tomcat/webapps/*
cd /vagrant/public/ && git clone $REPO && cd /vagrant/public/financeiro-web-jsf/ && mvn clean install
sudo cp /vagrant/public/financeiro-web-jsf/target/financeiro.war /usr/local/tomcat/webapps/
cd /usr/local/tomcat/webapps/ && sudo mv financeiro.war ROOT.war

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vENh0znCvPL93T9E'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vENh0znCvPL93T9E'
sudo apt-get -y install mysql-server --force-yes
echo -e "create database financeiro" | mysql -u root -pvENh0znCvPL93T9E
echo -e "GRANT ALL PRIVILEGES ON financeiro.* TO financeiro@localhost IDENTIFIED BY 'C41ZBxAmSLhRZliF' WITH GRANT OPTION;" | mysql -u root -pvENh0znCvPL93T9E
cat /vagrant/files/banco.sql | mysql -u root -pvENh0znCvPL93T9E financeiro

#Star Tomcat
sudo sh /usr/local/tomcat/bin/startup.sh
sleep 10
cd /etc/apache2/sites-avaliable/
sudo a2dissite manutencao.conf
sudo a2ensite default.conf
sudo service apache2 reload

echo "##########################################"
echo ""
echo "	acesse http://localhost:8081"
echo""
echo "##########################################"
