
if node['platform'] == 'windows'
  windows_feature 'IIS-ASPNET45' do
    action :install
    all true
  end

  cookbook_file 'C:\inetpub\wwwroot\test.aspx' do
    source 'test.aspx'
  end
else
  package 'PHP-Apache-Module' do
    package_name 'libapache2-mod-php'
    action :install
    notifies :restart, 'service[apache2]', :immediate
  end

  cookbook_file '/var/www/html/test.php' do
    source 'test.php'
  end
end
