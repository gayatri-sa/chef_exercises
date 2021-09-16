#
# Cookbook:: myhaproxy
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

# members_pool = ['Redhat 10.59.193.15 check']
members_pool = []
all_web_nodes = search('node', "policy_name:company_web AND policy_group:#{node['policy_group']}")
all_web_nodes.each do |web_node|
  webserver = "#{web_node['hostname']} #{web_node['cloud']['local_ipv4']} check"
  members_pool.push(webserver)
end

haproxy_install 'package'

haproxy_frontend 'http-in' do
  bind '*:80'
  default_backend 'servers'
end

haproxy_backend 'servers' do
  server members_pool
  extra_options(
    'balance' => 'roundrobin'
  )
end

haproxy_service 'haproxy' do
  action [ :enable, :start ]
  subscribes :reload, 'template[/etc/haproxy/haproxy.cfg]', :delayed
end

# when you forget to add the subscribes line, you need to manually restart the service
haproxy_service 'restart' do
  service_name 'haproxy'
  action [ :reload ]
end
