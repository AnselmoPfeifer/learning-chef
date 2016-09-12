# Criando um novo cookbook
- vagrand box add {debian-8} http://static.gender-api.com/debian-8-jessie-rc2-x64-slim.box
	Adicionar uma nova imagem.

- chef generate cookbook anselmo_pfeifer //gerar o cookbook com o nome de anselmo_pfeifer
- knife cookbook create anselmo_pfeifer --cookbook-path . //Cria um cookbook no diretorio que esta (.)
Proximos passos para validar o cookbook "anselmo_pfeifer"
- cd anselmo_pfeifer	//Acessar o diretorio do novo cookbook
- kitchen init --create-gemfile // Cria o arquivo Genfile e outros.
- bundle install // Instala as dependencias.
- chef generate file motd // Cria o diretorio e o arquivo em file/default/motd dentro do novo cookbook

	Adicione uma mensagem dentro do arquivo motd
	_________________________________________________
    
    ------------------------------------------------
              \   ^__^
               \  (oo)\_______
                  (__))\/\    \
                      ||----w |
                      ||     ||
    
    ------------------------------------------------
    _________________________________________________	
 
 Edite a receita default (recipes/default.rb) e adicione as linhas abaixo:
	cookbook_file "/etc/motd" do
	  source "motd"
	  mode "0644"
	end

- chef generate template index.html //Cria o template index.html.rb // Ou pode usar o comando abaixo
- touch templates/default/index.html.erb

- kitchen list // Lista os tipos de Instancia
- kitchen create <nome da instancia> // Criar uma nova instancia
- kitchen converge <nome da instancia> // Criar uma nova instancia e faz o deploy do cookbook 
- kitchen login default-centos-71 //Faz  o login  na nova instancia criada.
- kitchen destroy  default-centos-71 //destroy a instancia criada.
