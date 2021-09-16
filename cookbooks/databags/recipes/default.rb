#
# Cookbook:: databags
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

common_databag = data_bag('common')
common_company_info_item = data_bag_item('common', 'company_info')
mysql_password = Chef::EncryptedDataBagItem.load('passwords', 'mysql')

log '============ Items in the common databag' do
  level :warn
  message "#{common_databag.flatten()}"
end

log '============ Key-Value pairs in the company_info item > common databag' do
  level :warn
  message "#{common_company_info_item.flatten()}"
end

log '============ Encrypted MySQL Password' do
  level :warn
  message "#{mysql_password['password']}"
end

template '/root/sample.txt' do
  source 'sample.txt.erb'
end
