#
# Cookbook Name:: anselmo_pfeifer
# Recipe:: apache2
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
sites = node['apache']['sites']
package "apache2"

sites.each { |site| }do
  templates "/etc/apache2/sites-available/#{site}.conf" do
    source "apache2/default.erb"
    owner "root"
    group "root"
    mode 644
  end
end

template "/var/www/index.php" do
  source 'index.php.erb'
  mode '0755'
  owner 'www-data'
  group 'www-data'
end
