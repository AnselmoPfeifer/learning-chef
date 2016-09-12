name 'anselmo_pfeifer'
maintainer 'Anselmo Pfeifer'
maintainer_email 'contato@anselmo.pfeifer'
license 'all_rights'
description 'Installs/Configures anselmo_pfeifer'
long_description 'Installs/Configures anselmo_pfeifer'
version '0.1.0'

depends 'apache2', '= 3.2.0'
depends 'php', '= 1.8.0'

recipe "anselmo_pfeifer",   "Receita default"
recipe "anselmo_pfeifer::message",  "Altera a mensagem defalt do motd"
recipe "anselmo_pfeifer::apache2",  "Instala apache 2 e habilitar os modulos"
recipe "anselmo_pfeifer::php",  "Instala PHP"
