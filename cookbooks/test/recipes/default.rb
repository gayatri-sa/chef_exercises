#
# Cookbook:: test
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

file 'create file' do
  path '/root/test.txt'
  content 'This is a test file'
  action :create
end

file '/root/help.txt' do
  content 'This is a help file'
end

package 'install apache' do
  package_name 'apache2'
  action :install
end
