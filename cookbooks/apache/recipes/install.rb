package 'apache2' do
  action :install
end

service 'apache2' do
  action [ :enable, :start ]
end

package 'install-packages' do
  action :install
  package_name ['curl','nano','wget','tree']
end

package 'vim' do
  action :remove
end
