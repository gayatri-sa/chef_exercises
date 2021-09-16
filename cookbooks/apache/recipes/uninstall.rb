package 'apache2' do
  action :remove
end

service 'apache2' do
  action [ :stop, :disable ]
end

package 'install-packages' do
  action :remove
  package_name ['curl','nano','wget','tree']
end

package 'vim' do
  action :install
end
