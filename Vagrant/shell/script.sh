#!/bn/bash
REPO="https://github.com/AnselmoPfeifer/financeiro-web-jsf.git"

#Instalar java e Tomcat git maven zip
echo "##########################################"
echo ""
echo "	Instalando as dependencias	"
echo ""
echo "##########################################"

sudo apt-get update --force-yes
sudo apt-get upgrade --force-yes
sudo apt-get -y install apache2 git zip maven --force-yes

echo "##########################################"
echo ""
echo "  Clonando o repositorio	&& Instalar JAVA8"
echo ""
echo "##########################################"

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

echo "##########################################"
echo ""
echo "  Instalando Tomcat      "
echo ""
echo "##########################################"

#Instalar tomcat
cd /usr/local/ && wget http://ftp.unicamp.br/pub/apache/tomcat/tomcat-8/v8.0.32/bin/apache-tomcat-8.0.32.zip
cd /usr/local/ && sudo unzip apache-tomcat-8.0.32.zip && sudo mv apache-tomcat-8.0.32 tomcat && cd /usr/local/tomcat/bin/ && sudo chmod +x *.sh
sudo rm /usr/local/apache-tomcat-8.0.32.zip
sudo sh /usr/local/tomcat/bin/shutdown.sh
sudo rm -rf /usr/local/tomcat/webapps/*

echo "##########################################"
echo ""
echo "  Deploy da Aplicacao web    "
echo ""
echo "##########################################"
cd /vagrant/public/ && git clone $REPO && cd /vagrant/public/financeiro-web-jsf/ && mvn clean install
sudo cp /vagrant/public/financeiro-web-jsf/target/financeiro.war /usr/local/tomcat/webapps/
cd /usr/local/tomcat/webapps/ && sudo mv financeiro.war ROOT.war

echo "##########################################"
echo ""
echo "  Instalar MySQl Server e criar Banco de Dados financeiro "
echo "	Copiar dados exemplos para o banco financeiro
echo """
echo "##########################################"
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vENh0znCvPL93T9E'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vENh0znCvPL93T9E'
sudo apt-get -y install mysql-server --force-yes
echo -e "create database financeiro" | mysql -u root -pvENh0znCvPL93T9E
echo -e "GRANT ALL PRIVILEGES ON financeiro.* TO financeiro@localhost IDENTIFIED BY 'C41ZBxAmSLhRZliF' WITH GRANT OPTION;" | mysql -u root -pvENh0znCvPL93T9E
cat /vagrant/banco.sql | mysql -u root -pvENh0znCvPL93T9E financeiro

#Star Tomcat
sudo sh /usr/local/tomcat/bin/startup.sh
sleep 5
clear
echo "##########################################"
echo ""
echo "	acesse http://localhost:8081"
echo""
echo "##########################################"

