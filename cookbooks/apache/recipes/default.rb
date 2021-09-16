#
# Cookbook:: apache
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

include_recipe 'apache::install'

cookbook_file '/var/www/html/index.html' do
  source 'custom-index.html'
end
