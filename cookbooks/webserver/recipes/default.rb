#
# Cookbook:: webserver
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# node.force_default['messages']['welcome'] = 'Hello and Welcome to Chef. This is from the webserver recipe.'
node.default['messages']['welcome'] = 'Hello and Welcome to Chef. This is from the webserver recipe.'

if node['platform'] == 'windows'
  include_recipe 'iis::default'
  edit_resource(:cookbook_file, 'C:\inetpub\wwwroot\index.html') do
    source 'homepage.html'
    cookbook 'webserver'
    action :nothing
  end
  homepage_path = 'C:\inetpub\wwwroot\index.html'
else
  include_recipe 'apache::default'
  edit_resource(:cookbook_file, '/var/www/html/index.html') do
    source 'homepage.html'
    cookbook 'webserver'
    action :nothing
  end
  homepage_path = '/var/www/html/index.html'
end

template 'Create homepage' do
  path "#{homepage_path}"
  source 'homepage-template.erb'
  variables(
    title: "Let's Learn Chef",
    desc: "DevOps Professional!"
  )
end
