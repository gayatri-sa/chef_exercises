# Policyfile.rb - Describe how you want Chef Infra Client to build your system.
#
# For more information on the Policyfile feature, visit
# https://docs.chef.io/policyfile/

# A name that describes what the system you're building with Chef does.
name 'iis'

# Where to find external cookbooks:
# default_source :chef_repo, "../cookbooks" do |s|
#   s.preferred_for "win_mariadb", "iis", "apache"
# end
# default_source :chef_server, 'https://10.59.193.16/organizations/testorg' do |s|
#    s.preferred_for "webserver"
# end
# default_source :supermarket do |s|
#   s.preferred_for "git", "ark", "seven_zip"
# end

default_source :chef_repo, "../cookbooks"

# run_list: chef-client will run these recipes in the order specified.
run_list "recipe[git::default]", "recipe[webserver::default]", "recipe[win_mariadb::default]", "recipe[webserver::project]", "recipe[win_mariadb::asp_connector]"

# Specify a custom source for a single cookbook:
# cookbook 'example_cookbook', path: '../cookbooks/example_cookbook'

cookbook 'git', '~> 11.0.0', :supermarket
# cookbook 'webserver', '= 0.2.0'
cookbook 'webserver'
cookbook 'win_mariadb'
