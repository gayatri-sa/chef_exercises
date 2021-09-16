# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'loadbalancer'

# Where to find external cookbooks:
default_source :supermarket

# run_list: chef-client will run these recipes in the order specified.
run_list "recipe[chef-client::default]",'myhaproxy::default'

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

cookbook 'myhaproxy', path: '../cookbooks/myhaproxy'
cookbook 'haproxy', '~> 12.2.1', :supermarket
cookbook 'chef-client', '~> 12.3.4', :supermarket

default['chef_client']['interval'] = '60' # 60 seconds for Linux machines
default['chef_client']['task']['frequency_modifier'] = '1' # 1 min for Windows machines
