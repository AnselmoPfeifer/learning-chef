#
# Cookbook Name:: anselmo_pfeifer
# Recipe:: message
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
node.default['anselmo_pfeifer']['company'] = '"Inc Minha Companhia"'
node.default['anselmo_pfeifer']['message'] = 'a melhor companhia do universo!'
node.default['anselmo_pfeifer']['ipaddress'] = '192.168.0.100'
node.default['anselmo_pfeifer']['hostname'] = 'apache2-centos-65'
node.default['anselmo_pfeifer']['motd'] = '
________________________________________________

------------------------------------------------
          \   ^__^
           \  (oo)\_______
              (__))\/\    \
                  ||----w |
                  ||     ||

------------------------------------------------
________________________________________________
'

template '/etc/motd' do
  source 'motd.erb'
  mode "0644"
end