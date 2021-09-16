# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'company_web'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "recipe[chef-client::default]", "recipe[git::default]", "recipe[webserver::default]", "recipe[webserver::simpleproject]"

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

cookbook 'webserver', path: '../cookbooks/webserver'
cookbook 'chef-client', '~> 12.3.4', :supermarket
cookbook 'git', '~> 11.0.1', :supermarket
cookbook 'apache', path: '../cookbooks/apache'
cookbook 'iis', path: '../cookbooks/iis'

default['chef_client']['interval'] = '60' # 60 seconds for Linux machines
default['chef_client']['task']['frequency_modifier'] = '1' # 1 min for Windows machines
