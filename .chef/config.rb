current_dir = File.dirname(__FILE__)
ssl_verify_mode   :verify_none
log_level         :info
log_location      STDOUT
node_name         "gayatri"
cookbook_path     ["#{current_dir}/../chef-repo/cookbooks"]
role_path         ["#{current_dir}/../chef-repo/roles"]

knife[:editor] = '"C:\Windows\notepad.exe"'
