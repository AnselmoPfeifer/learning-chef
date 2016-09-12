#
# Cookbook Name:: anselmo_pfeifer
# Recipe:: default
#
# Copyright (c) 2016 The Authors, All Rights Reserved.
require 'pp'

include_recipe 'anselmo_pfeifer::message'
include_recipe 'anselmo_pfeifer::apache2'
include_recipe 'anselmo_pfeifer::php'

pp node.debug_value('ipaddress')
