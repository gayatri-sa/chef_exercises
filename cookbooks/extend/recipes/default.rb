#
# Cookbook:: extend
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# custom ohai attribute 'whoami'
log "Custom Ohai Attribute" do
  level :warn
  message "Custom Ohai Attribute WhoAmI: #{node['whoami']}"
end

extend_from_git 'https://github.com/schogini/customweb' do
  folder_name 'simple'
end
