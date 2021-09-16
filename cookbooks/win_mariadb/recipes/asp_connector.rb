dir = ['C:\tmp', 'C:\inetpub\wwwroot\Bin']
dir.each do |d|
  directory "Create folder#{d}" do
    path "#{d}"
    action :create
    recursive true
  end
end

remote_file 'Download MySQL Connector' do
  source 'https://dev.mysql.com/get/archives/mysql-connector-net-8.0/mysql-connector-net-8.0.23.msi'
  path 'C:\tmp\mysql-connector-net-8.0.23.msi'
end

windows_package 'Install MySQL Connector' do
  # package_name 'mysql-connector-net'
  action :install
  installer_type :msi
  source 'C:\tmp\mysql-connector-net-8.0.23.msi'
end

powershell_script 'Copy MySQL DLL to IIS' do
  code 'copy "C:\Program Files (x86)\MySQL\MySQL Connector Net 8.0.23\Assemblies\v4.5.2\MySql.Data.dll" C:/inetpub/wwwroot/Bin/'
  creates 'C:/inetpub/wwwroot/Bin/MySql.Data.dll'
end
