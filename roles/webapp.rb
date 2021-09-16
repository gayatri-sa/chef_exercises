name "webapp"
description "Setup a server to host a web application with ASP.NET and MySQL"
run_list "recipe[git::default]", "recipe[webserver::default]", "recipe[win_mariadb::default]", "recipe[webserver::project]", "recipe[win_mariadb::asp_connector]"
default_attributes({
  'messages' => {
    'welcome' => 'Hello and Welcome to Chef. This is from the role.'
  }
})
