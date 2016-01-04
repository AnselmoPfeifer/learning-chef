#########################################
#					#
#	Comandos basicos 		#
#					#
#########################################

kitchen init --create-gemfile
#Cria a estrutura de arquivos do Chef

bundle install
#Instala as dependencias 	

kitchen list
#Imprimi os nomes de instância disponíveis

kitchen create default-centos65
#Cria um ambiente virtual executando CentOS 6.5

VBoxManage list runningvms
#Lista as VMs que estao rodando

kitchen login default-centos65
#Executa o login na vm default-centos65

kitchen destroy default-centos65
#Destroy a vm default-centos65

chef-client --version
#Verifica a versao do chef-client

curl -Lk https://www.getchef.com/chef/install.sh | sudo bash
#Se nao tiver instalado o comando acima faz o download e instala
