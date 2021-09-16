#
# Cookbook:: iis
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

windows_feature 'IIS-WebServer' do
  action :install
  all true
end

windows_feature 'IIS-DefaultDocument' do
  action :install
end

service 'w3svc' do
  action [ :enable, :start ]
end

cookbook_file 'C:\inetpub\wwwroot\index.html' do
  source 'custom-index.html'
end
