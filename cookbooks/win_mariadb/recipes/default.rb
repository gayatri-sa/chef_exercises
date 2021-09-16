#
# Cookbook:: win_mariadb
# Recipe:: default
#
# Copyright:: 2021, The Authors, All Rights Reserved.

directory "Create folder C:\tmp" do
  action :create
  path 'C:\tmp'
  recursive true
end

remote_file 'Download MariaDB MSI' do
 source 'https://downloads.mariadb.org/f/mariadb-10.5.8/winx64-packages/mariadb-10.5.8-winx64.msi/from/https%3A//archive.mariadb.org/?serve'
 path 'C:\tmp\mariadb-10.5.8-winx64.msi'
end

windows_package 'Install MariaDB' do
  package_name 'mariadb'
  action :install
  installer_type :msi
  source 'C:\tmp\mariadb-10.5.8-winx64.msi'
  options "PORT=3306 ALLOWREMOTEROOTACCESS=true PASSWORD=dbrootpass SERVICENAME=MySQL"
end

windows_path 'Add MySQL command to the path variable' do
  path 'C:\Program Files\MariaDB 10.5\bin'
  action :add
end
