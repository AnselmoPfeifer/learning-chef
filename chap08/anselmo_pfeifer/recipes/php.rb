#
# Cookbook Name:: anselmo_pfeifer
# Recipe:: php
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
package "php5"

package "mcrypt" do
  action :install
end

package "php5-mcrypt" do
  action :install
end

package "php5-mysqlnd" do
  action :install
end

package "openssl" do
  action :install
end

package "libapache2-mod-php5" do
  action :install
end

execute 'max_execution_time_php' do
  command 'perl -p -i -e "s/max_execution_time = 30/max_execution_time = 120/g" /etc/php5/apache2/php.ini'
end 
