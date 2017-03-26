# Comandos basicos

kitchen init --create-gemfile
- Cria a estrutura de arquivos do Chef

bundle install
- Instala as dependencias 	

kitchen list
- Imprimi os nomes de instância disponíveis

kitchen create default-centos65
- Cria um ambiente virtual executando CentOS 6.5

VBoxManage list runningvms
- Lista as VMs que estao rodando

kitchen login default-centos65
- Executa o login na vm default-centos65

kitchen destroy default-centos65
- Destroy a vm default-centos65

chef-client --version
- Verifica a versao do chef-client

curl -Lk https://www.getchef.com/chef/install.sh | sudo bash
- Se nao tiver instalado o comando acima faz o download e instala

chef generate cookbook motd //gerar o cookbook com o nome de motd
chef generate file motd - //gera o dir files e o arquivo motd para add as msgs. Execute dentro do cookbook
	Para usar este novo motd como msg padrao deve editar recipes/default.rb adicionando
		cookbook_file "/etc/motd" do
		  source "motd"
		  mode "0644"
		end

knife cookbook create motd --cookbook-path .
Cria um cookbook no diretorio que esta (.)
        ** Creating cookbook motd
        ** Creating README for cookbook: motd
        ** Creating CHANGELOG for cookbook: motd
        ** Creating metadata for cookbook: motd

Proximos passos para validar o cookbook "motd"
	cd motd	//Acessar o diretorio do novo cookbook
	kitchen init --create-gemfile // Cria o arquivo Genfile, se der conflito eh por que 
		ja existe no dir motd um arquivo com este nome. 
	bundle install // Instala as dependencias.
	kitchen list // Lista os tipos de Instancia
 	kitchen create <nome da instancia> // Criar uma nova instancia
 	kitchen converge <nome da instancia> // Criar uma nova instancia e faz o deploy do cookbook 
	
kitchen login default-centos-71 //Faz  o login  na nova instancia criada.
Last login: Sat Mar 26 22:37:22 2016 from 10.0.2.2
_________________________________________________

------------------------------------------------
          \   ^__^
           \  (oo)\_______
              (__))\/\    \
                  ||----w |
                  ||     ||

------------------------------------------------
_________________________________________________	

//Observer que agora a mensagem de login eh diferente da Padrao do sistema CentOS.
kitchen destroy  default-centos-71 //destroy a instancia criada.
