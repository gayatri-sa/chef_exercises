# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'php_webapp'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "recipe[git::default]", "recipe[webserver]", "recipe[php::default]", "recipe[chef-client::default]"

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

cookbook 'chef-client', '~> 12.3.4', :supermarket
cookbook 'php', '~> 8.1.2', :supermarket
cookbook 'git', '~> 11.0.0', :supermarket
cookbook 'webserver', '> 0.1.0', path: '../cookbooks/webserver'
cookbook 'apache', path: '../cookbooks/apache'
cookbook 'iis', path: '../cookbooks/iis'

default['chef_client']['interval'] = '30'
default['prod']['chef_client']['interval'] = '30'
