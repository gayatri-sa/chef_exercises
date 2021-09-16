# Clone a website from a GitHub repo into the appropriate folder

unified_mode true

property :repo_name, String, name_property: true
property :folder_name, String, default: ''
property :webserver, String, default: 'apache'

# The first action is always the default action
action :create do
  # find the folder root depending on the OS and Webserver
  if platform?('windows')
    root_folder = 'C:/inetpub/wwwroot/'
  elsif new_resource.webserver == 'nginx'
    root_folder= '/usr/share/nginx/html/'
  else
    root_folder = '/var/www/html/'
  end

  # delete the folder before clone, else clone will give an error "folder already exists"
  folder = "#{root_folder}#{new_resource.folder_name}"
  directory "#{folder}" do
    action :delete
    recursive true
    only_if { ::File.directory?("#{folder}") }
  end

  # clone the repo into othe correct folder
  git 'get_repo' do
    destination "#{folder}" # If not specified then, it will clone to /git_repo No trailing /
    repository new_resource.repo_name
    action :checkout
    not_if { ::File.directory?("#{folder}") }
  end
end
