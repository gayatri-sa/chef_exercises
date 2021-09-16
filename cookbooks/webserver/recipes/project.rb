windows_feature 'IIS-ASPNET45' do
  action :install
  all true
end

git 'Clone Repo' do
  repository 'https://github.com/gayatri-sa/simple_dotnet'
  destination 'C:/inetpub/wwwroot/simple'
end

execute 'Execute the SQL file' do
  command 'mysql -h 127.0.0.1 -u root -pdbrootpass -e "source C:/inetpub/wwwroot/simple/SQL/MySQL.sql"'
  cwd     'C:\Program Files\MariaDB 10.5\bin'
end
