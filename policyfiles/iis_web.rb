# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'iis_web'

# Where to find external cookbooks:
default_source :supermarket, "https://supermarket.chef.io" do |s|
  s.preferred_for "seven_zip", "git", "ark"
end
default_source :chef_server, 'https://10.59.193.16/organizations/testorg'


# run_list: chef-client will run these recipes in the order specified.
run_list "recipe[git::default]", "recipe[webserver::default]", "recipe[win_mariadb::default]", "recipe[webserver::project]", "recipe[win_mariadb::asp_connector]", "recipe[chef-client::default]"

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

cookbook 'chef-client', '~> 12.3.4', :supermarket
cookbook 'git', '~> 11.0.0', :supermarket
cookbook 'webserver', '= 0.2.0'
cookbook 'apache', path: '../cookbooks/apache'
cookbook 'iis', path: '../cookbooks/iis'
cookbook 'win_mariadb', path: '../cookbooks/win_mariadb'

default['messages']['welcome'] = 'Hello and Welcome to Chef. This is from the policyfile.'
default['chef_client']['interval'] = '30'
default['prod']['chef_client']['interval'] = '30'
default['live']['chef_client']['interval'] = '30'
